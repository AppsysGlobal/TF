pipeline {
    agent any

    environment {
        TF_LOG = "DEBUG" // Optional: enables debug logging for Terraform
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/AppsysGlobal/TF.git'
            }
        }

        stage('Terraform Init & Import') {
            steps {
                withCredentials([
                    string(credentialsId: 'oci-tenancy-ocid', variable: 'TF_VAR_tenancy_ocid'),
                    string(credentialsId: 'oci-user-ocid', variable: 'TF_VAR_user_ocid'),
                    string(credentialsId: 'oci-fingerprint', variable: 'TF_VAR_fingerprint'),
                    string(credentialsId: 'oci-region', variable: 'TF_VAR_region'),
                    file(credentialsId: 'oci-private-key', variable: 'TF_VAR_private_key_path')
                ]) {
                    sh '''
                        terraform init -reconfigure

                        terraform import oci_core_instance.vm1 ocid1.instance.oc1.iad.anuwcljtggm52bqcicnvzligentjkfjr7yfglykfg3c5uu2enyhw3uhplxfa
                        terraform import oci_core_instance.vm2 ocid1.instance.oc1.iad.anuwcljtggm52bqclaqjgzrxtgbganiiijfpdhjqbhowywj4vpyjcfv6bvxa
                        terraform import oci_core_subnet.subnet1 ocid1.subnet.oc1.iad.aaaaaaaaxeyq7yugxchxhh74vfl6tmfojvyuqpdy567svjpw3xh3ex6d2mwa
                        terraform import oci_core_virtual_network.vcn1 ocid1.vcn.oc1.iad.amaaaaaaggm52bqau6nh5vdtsobv57ucuqpqo4wnsyy5tv6w3aotybggerca
                    '''
                }
            }
        }

        stage('Terraform Show State') {
            steps {
                sh '''
                    terraform show -no-color > imported_state.tf
                    echo "Resources successfully imported and written to imported_state.tf"
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    terraform plan -out=tfplan
                    echo "Terraform plan completed and stored in tfplan file."
                '''
            }
        }
    }
}
