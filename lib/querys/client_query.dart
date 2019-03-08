String clientsQ(String docId, int status) {
  return """
    query {
    Client(DoctorId: $docId, status: $status){
    id
    firstname
    lastname
    telnum
    status
  }
}
    """
      .replaceAll('\n', ' ');
}
