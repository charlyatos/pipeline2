//package com.alan.finalAPIconsultorios.grpcservice;
//
//import com.alan.finalAPIconsultorios.serviceImpl.UserServiceImpl;
//import com.doctorsrvc.grpc.*;
//import com.google.common.util.concurrent.ListenableFuture;
//import io.grpc.StatusRuntimeException;
//import net.devh.boot.grpc.client.inject.GrpcClient;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.concurrent.ExecutionException;
//
//@Service
//public class UserGrpcServiceImpl{
//    @Autowired
//    private UserServiceImpl userService;
//
////    private doctorServiceGrpc doctorServiceGrpc;
//
//    @GrpcClient("doctor-service")
//    private doctorServiceGrpc.doctorServiceFutureStub doctorServiceFutureStub; //For asynchronous call
//
//    // For synchronous call
////    private com.doctorsrvc.grpc.doctorServiceGrpc.doctorServiceBlockingStub doctorServiceBlockingStub;
//
//    public Doctor grpcGetByIdRRequest(Long id){
//        try {
//            final ListenableFuture<Doctor> doctor= doctorServiceFutureStub.getDoctorById(doctorId.newBuilder().setId(id).build());
//            return doctor.get();
//        }catch (final Exception e){
//            return Doctor.newBuilder().build();
//        }
//    }
//
//
//
//}
