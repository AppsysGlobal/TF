pipeline {
    agent any

    environment {
        TF_VAR_tenancy_ocid = credentials('oci-tenancy-ocid')
        TF_VAR_user_ocid    = credentials('oci-user-ocid')
        TF_VAR_fingerprint  = credentials('OCI_Fingerprint')
        TF_VAR_region       = 'us-ashburn-1'
        TF_VAR_private_key_path = '/var/lib/jenkins/.oci/oci_api_key.pem'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/AppsysGlobal/TF.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    terraform init
                '''
            }
        }

        stage('Terraform Import Resources') {
            steps {
                sh '''
                    terraform import oci_core_instance.vm1 ocid1.instance.oc1.iad.anuwcljtggm52bqcicnvzligentjkfjr7yfglykfg3c5uu2enyhw3uhplxfa
                    terraform import oci_core_instance.vm2 ocid1.instance.oc1.iad.anuwcljtggm52bqclaqjgzrxtgbganiiijfpdhjqbhowywj4vpyjcfv6bvxa
                    terraform import oci_core_subnet.subnet1 ocid1.subnet.oc1.iad.aaaaaaaaxeyq7yugxchxhh74vfl6tmfojvyuqpdy567svjpw3xh3ex6d2mwa
                    terraform import oci_core_virtual_network.vcn1 ocid1.vcn.oc1.iad.amaaaaaaggm52bqau6nh5vdtsobv57ucuqpqo4wnsyy5tv6w3aotybggerca
                '''
            }
        }

        stage('Terraform Show State') {
            steps {
                sh '''
                    terraform show -no-color > imported_state.tf
                '''
            }
        }
    }
}
