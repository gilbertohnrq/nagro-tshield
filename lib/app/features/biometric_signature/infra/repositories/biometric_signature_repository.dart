import 'package:finan/app/features/biometric_signature/domain/failures/biometric_signature_failures.dart';
import 'package:finan/app/features/biometric_signature/domain/repositories/i_biometric_signature_repository.dart';
import 'package:finan/app/features/biometric_signature/external/exceptions/biometric_signature_exceptions.dart';
import 'package:finan/app/features/biometric_signature/external/i_biometric_signature_service.dart';
import 'package:finan/app/features/biometric_signature/infra/models/get_proposal_available_response.dart';
import 'package:finan/app/features/biometric_signature/infra/models/ocr_document_request.dart';
import 'package:finan/app/features/biometric_signature/infra/models/ocr_document_response.dart';
import 'package:finan/app/features/biometric_signature/infra/models/refuse_request.dart';
import 'package:finan/app/features/biometric_signature/infra/models/refuse_response.dart';
import 'package:finan/app/features/biometric_signature/infra/models/sign_contract_request.dart';
import 'package:result_dart/result_dart.dart';

class BiometricSignatureRepositoryImpl
    implements IBiometricSignatureRepository {
  final IBiometricSignatureService _service;

  BiometricSignatureRepositoryImpl(
      {required IBiometricSignatureService service})
      : _service = service;

  @override
  AsyncResult<GetProposalAvailableResponse, BiometricSignatureFailure>
      getProposeAvailable() async {
    try {
      final GetProposalAvailableResponse response =
          await _service.getProposeAvailable();
      return Success(response);
    } on NotFoundException {
      return Failure(BiometricSignatureNotFound());
    } on InternalServerException {
      return Failure(NotAuthorized());
    } on InvalidDataException {
      return Failure(InvalidData());
    }
  }

  @override
  AsyncResult<bool, BiometricSignatureFailure> signContract(
      SignContractRequest signContractRequest) async {
    try {
      final bool response = await _service.signContract(signContractRequest);
      return Success(response);
    } on NotFoundException {
      return Failure(BiometricSignatureNotFound());
    } on InternalServerException {
      return Failure(NotAuthorized());
    } on InvalidDataException {
      return Failure(InvalidData());
    }
  }

  @override
  AsyncResult<OcrDocumentResponse, BiometricSignatureFailure> ocrDocument(
      OcrDocumentRequest ocrDocumentRequest) async {
    try {
      final  response = await _service.ocrDocument(ocrDocumentRequest);
      return Success(response);
    } on NotFoundException {
      return Failure(BiometricSignatureNotFound());
    } on InternalServerException {
      return Failure(NotAuthorized());
    } on InvalidDataException {
      return Failure(InvalidData());
    }
  }

  @override
  AsyncResult<RefuseResponse, BiometricSignatureFailure> refuse(
      RefuseRequest refuseRequest) async {
    try {
      final RefuseResponse response = await _service.refuse(refuseRequest);
      return Success(response);
    } on NotFoundException {
      return Failure(BiometricSignatureNotFound());
    } on InternalServerException {
      return Failure(NotAuthorized());
    } on InvalidDataException {
      return Failure(InvalidData());
    }
  }
}
