import hcl2
import pytest
import os

TF_DIR = os.path.join(os.path.dirname(__file__), "../../terraform")

def load_tf_file(filename):
    with open(os.path.join(TF_DIR, filename), "r") as f:
        return hcl2.load(f)

def strip_quotes(s):
    return s.strip('"')

def test_variables_file_exists():
    assert os.path.exists(os.path.join(TF_DIR, "variables.tf"))

def test_main_file_exists():
    assert os.path.exists(os.path.join(TF_DIR, "main.tf"))

def test_backend_file_exists():
    assert os.path.exists(os.path.join(TF_DIR, "backend.tf"))

def test_required_variables_declared():
    tf = load_tf_file("variables.tf")
    declared = [strip_quotes(list(v.keys())[0]) for v in tf["variable"]]
    assert "project_id" in declared
    assert "region" in declared
    assert "finance_analyst_sa" in declared
    assert "marketing_analyst_sa" in declared

def test_no_hardcoded_project_id_in_main():
    with open(os.path.join(TF_DIR, "main.tf"), "r") as f:
        content = f.read()
    assert "project-15293a08-1ca4-40fa-8eb" not in content

def test_iam_bindings_exist():
    tf = load_tf_file("main.tf")
    resources = tf.get("resource", [])
    resource_types = []
    for r in resources:
        resource_types.extend([strip_quotes(k) for k in r.keys()])
    assert "google_bigquery_dataset_iam_member" in resource_types
    assert "google_project_iam_member" in resource_types

def test_dev_tfvars_exists():
    assert os.path.exists(os.path.join(TF_DIR, "environments/dev.tfvars"))