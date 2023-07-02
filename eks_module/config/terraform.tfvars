
aws_eks_cluster_config = {

      "demo-cluster" = {

        eks_cluster_name         = "demo-cluster1"
        eks_subnet_ids = ["subnet-0a9e962333760dcf6","subnet-0d7fd4c88b1579e31","subnet-091d90c7c4f2a4a1c"]
        tags = {
             "Name" =  "demo-cluster"
         }  
      }
}

eks_node_group_config = {

  "node1" = {

        eks_cluster_name         = "demo-cluster"
        node_group_name          = "mynode"
        nodes_iam_role           = "eks-node-group-general1"
        node_subnet_ids          = ["subnet-0a9e962333760dcf6","subnet-0d7fd4c88b1579e31","subnet-091d90c7c4f2a4a1c"]

        tags = {
             "Name" =  "node1"
         } 
  }
}