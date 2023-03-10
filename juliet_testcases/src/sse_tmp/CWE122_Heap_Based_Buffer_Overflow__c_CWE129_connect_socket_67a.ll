; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType = type { i32 }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType* %myStruct, metadata !73, metadata !DIExpression()), !dbg !78
  store i32 -1, i32* %data, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !80, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !83, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %connectSocket, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  br label %do.body, !dbg !110

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !111
  store i32 %call, i32* %connectSocket, align 4, !dbg !113
  %0 = load i32, i32* %connectSocket, align 4, !dbg !114
  %cmp = icmp eq i32 %0, -1, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !118

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !120
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !121
  store i16 2, i16* %sin_family, align 4, !dbg !122
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !123
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !124
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !125
  store i32 %call1, i32* %s_addr, align 4, !dbg !126
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !127
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !128
  store i16 %call2, i16* %sin_port, align 2, !dbg !129
  %2 = load i32, i32* %connectSocket, align 4, !dbg !130
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !132
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !133
  %cmp4 = icmp eq i32 %call3, -1, !dbg !134
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !135

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !136

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !138
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !139
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !140
  %conv = trunc i64 %call7 to i32, !dbg !140
  store i32 %conv, i32* %recvResult, align 4, !dbg !141
  %5 = load i32, i32* %recvResult, align 4, !dbg !142
  %cmp8 = icmp eq i32 %5, -1, !dbg !144
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !145

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !146
  %cmp10 = icmp eq i32 %6, 0, !dbg !147
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !148

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !149

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !151
  %idxprom = sext i32 %7 to i64, !dbg !152
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !152
  store i8 0, i8* %arrayidx, align 1, !dbg !153
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !154
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !155
  store i32 %call15, i32* %data, align 4, !dbg !156
  br label %do.end, !dbg !157

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !158
  %cmp16 = icmp ne i32 %8, -1, !dbg !160
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !161

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !162
  %call19 = call i32 @close(i32 %9), !dbg !164
  br label %if.end20, !dbg !165

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !166
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !167
  store i32 %10, i32* %structFirst, align 4, !dbg !168
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !169
  %11 = load i32, i32* %coerce.dive, align 4, !dbg !169
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67b_badSink(i32 %11), !dbg !169
  ret void, !dbg !170
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #2

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #5

declare dso_local i64 @recv(i32, i8*, i64, i32) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #5

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67b_badSink(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_good() #0 !dbg !171 {
entry:
  call void @goodG2B(), !dbg !172
  call void @goodB2G(), !dbg !173
  ret void, !dbg !174
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !175 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !180, metadata !DIExpression()), !dbg !181
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !182, metadata !DIExpression()), !dbg !183
  %call = call i64 @time(i64* null) #7, !dbg !184
  %conv = trunc i64 %call to i32, !dbg !185
  call void @srand(i32 %conv) #7, !dbg !186
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !187
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_good(), !dbg !188
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !189
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !190
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_bad(), !dbg !191
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !192
  ret i32 0, !dbg !193
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !194 {
entry:
  %data = alloca i32, align 4
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType* %myStruct, metadata !197, metadata !DIExpression()), !dbg !198
  store i32 -1, i32* %data, align 4, !dbg !199
  store i32 7, i32* %data, align 4, !dbg !200
  %0 = load i32, i32* %data, align 4, !dbg !201
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !202
  store i32 %0, i32* %structFirst, align 4, !dbg !203
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !204
  %1 = load i32, i32* %coerce.dive, align 4, !dbg !204
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67b_goodG2BSink(i32 %1), !dbg !204
  ret void, !dbg !205
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67b_goodG2BSink(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !206 {
entry:
  %data = alloca i32, align 4
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !207, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType* %myStruct, metadata !209, metadata !DIExpression()), !dbg !210
  store i32 -1, i32* %data, align 4, !dbg !211
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !212, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !215, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !217, metadata !DIExpression()), !dbg !218
  store i32 -1, i32* %connectSocket, align 4, !dbg !218
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !219, metadata !DIExpression()), !dbg !220
  br label %do.body, !dbg !221

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !222
  store i32 %call, i32* %connectSocket, align 4, !dbg !224
  %0 = load i32, i32* %connectSocket, align 4, !dbg !225
  %cmp = icmp eq i32 %0, -1, !dbg !227
  br i1 %cmp, label %if.then, label %if.end, !dbg !228

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !229

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !231
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !231
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !232
  store i16 2, i16* %sin_family, align 4, !dbg !233
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !234
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !235
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !236
  store i32 %call1, i32* %s_addr, align 4, !dbg !237
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !238
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !239
  store i16 %call2, i16* %sin_port, align 2, !dbg !240
  %2 = load i32, i32* %connectSocket, align 4, !dbg !241
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !243
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !244
  %cmp4 = icmp eq i32 %call3, -1, !dbg !245
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !246

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !247

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !249
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !250
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !251
  %conv = trunc i64 %call7 to i32, !dbg !251
  store i32 %conv, i32* %recvResult, align 4, !dbg !252
  %5 = load i32, i32* %recvResult, align 4, !dbg !253
  %cmp8 = icmp eq i32 %5, -1, !dbg !255
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !256

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !257
  %cmp10 = icmp eq i32 %6, 0, !dbg !258
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !259

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !260

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !262
  %idxprom = sext i32 %7 to i64, !dbg !263
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !263
  store i8 0, i8* %arrayidx, align 1, !dbg !264
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !265
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !266
  store i32 %call15, i32* %data, align 4, !dbg !267
  br label %do.end, !dbg !268

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !269
  %cmp16 = icmp ne i32 %8, -1, !dbg !271
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !272

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !273
  %call19 = call i32 @close(i32 %9), !dbg !275
  br label %if.end20, !dbg !276

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !277
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !278
  store i32 %10, i32* %structFirst, align 4, !dbg !279
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !280
  %11 = load i32, i32* %coerce.dive, align 4, !dbg !280
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67b_goodB2GSink(i32 %11), !dbg !280
  ret void, !dbg !281
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67b_goodB2GSink(i32) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!59, !60, !61, !62, !63}
!llvm.ident = !{!64}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{!3, !16}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__socket_type", file: !4, line: 24, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket_type.h", directory: "")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15}
!7 = !DIEnumerator(name: "SOCK_STREAM", value: 1)
!8 = !DIEnumerator(name: "SOCK_DGRAM", value: 2)
!9 = !DIEnumerator(name: "SOCK_RAW", value: 3)
!10 = !DIEnumerator(name: "SOCK_RDM", value: 4)
!11 = !DIEnumerator(name: "SOCK_SEQPACKET", value: 5)
!12 = !DIEnumerator(name: "SOCK_DCCP", value: 6)
!13 = !DIEnumerator(name: "SOCK_PACKET", value: 10)
!14 = !DIEnumerator(name: "SOCK_CLOEXEC", value: 524288)
!15 = !DIEnumerator(name: "SOCK_NONBLOCK", value: 2048)
!16 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !17, line: 40, baseType: !5, size: 32, elements: !18)
!17 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "")
!18 = !{!19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44}
!19 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!20 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!21 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!22 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!23 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!24 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!25 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!26 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!27 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!28 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!29 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!30 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!31 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!32 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!33 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!34 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!35 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!36 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!37 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!38 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!39 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!40 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!41 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!42 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!43 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!44 = !DIEnumerator(name: "IPPROTO_MAX", value: 256)
!45 = !{!46, !5}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !48, line: 178, size: 128, elements: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!49 = !{!50, !54}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !47, file: !48, line: 180, baseType: !51, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !52, line: 28, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !47, file: !48, line: 181, baseType: !55, size: 112, offset: 16)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 112, elements: !57)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !{!58}
!58 = !DISubrange(count: 14)
!59 = !{i32 7, !"Dwarf Version", i32 4}
!60 = !{i32 2, !"Debug Info Version", i32 3}
!61 = !{i32 1, !"wchar_size", i32 4}
!62 = !{i32 7, !"uwtable", i32 1}
!63 = !{i32 7, !"frame-pointer", i32 2}
!64 = !{!"clang version 13.0.0"}
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_bad", scope: !66, file: !66, line: 52, type: !67, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67a.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 54, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 54, column: 9, scope: !65)
!73 = !DILocalVariable(name: "myStruct", scope: !65, file: !66, line: 55, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType", file: !66, line: 45, baseType: !75)
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_structType", file: !66, line: 42, size: 32, elements: !76)
!76 = !{!77}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !75, file: !66, line: 44, baseType: !71, size: 32)
!78 = !DILocation(line: 55, column: 78, scope: !65)
!79 = !DILocation(line: 57, column: 10, scope: !65)
!80 = !DILocalVariable(name: "recvResult", scope: !81, file: !66, line: 63, type: !71)
!81 = distinct !DILexicalBlock(scope: !65, file: !66, line: 58, column: 5)
!82 = !DILocation(line: 63, column: 13, scope: !81)
!83 = !DILocalVariable(name: "service", scope: !81, file: !66, line: 64, type: !84)
!84 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !85)
!85 = !{!86, !87, !93, !100}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !84, file: !17, line: 240, baseType: !51, size: 16)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !84, file: !17, line: 241, baseType: !88, size: 16, offset: 16)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !90, line: 25, baseType: !91)
!90 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !92, line: 40, baseType: !53)
!92 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !84, file: !17, line: 242, baseType: !94, size: 32, offset: 32)
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !95)
!95 = !{!96}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !94, file: !17, line: 33, baseType: !97, size: 32)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !90, line: 26, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !92, line: 42, baseType: !5)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !84, file: !17, line: 245, baseType: !101, size: 64, offset: 64)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 64, elements: !103)
!102 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!103 = !{!104}
!104 = !DISubrange(count: 8)
!105 = !DILocation(line: 64, column: 28, scope: !81)
!106 = !DILocalVariable(name: "connectSocket", scope: !81, file: !66, line: 65, type: !71)
!107 = !DILocation(line: 65, column: 16, scope: !81)
!108 = !DILocalVariable(name: "inputBuffer", scope: !81, file: !66, line: 66, type: !55)
!109 = !DILocation(line: 66, column: 14, scope: !81)
!110 = !DILocation(line: 67, column: 9, scope: !81)
!111 = !DILocation(line: 77, column: 29, scope: !112)
!112 = distinct !DILexicalBlock(scope: !81, file: !66, line: 68, column: 9)
!113 = !DILocation(line: 77, column: 27, scope: !112)
!114 = !DILocation(line: 78, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !66, line: 78, column: 17)
!116 = !DILocation(line: 78, column: 31, scope: !115)
!117 = !DILocation(line: 78, column: 17, scope: !112)
!118 = !DILocation(line: 80, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !66, line: 79, column: 13)
!120 = !DILocation(line: 82, column: 13, scope: !112)
!121 = !DILocation(line: 83, column: 21, scope: !112)
!122 = !DILocation(line: 83, column: 32, scope: !112)
!123 = !DILocation(line: 84, column: 39, scope: !112)
!124 = !DILocation(line: 84, column: 21, scope: !112)
!125 = !DILocation(line: 84, column: 30, scope: !112)
!126 = !DILocation(line: 84, column: 37, scope: !112)
!127 = !DILocation(line: 85, column: 32, scope: !112)
!128 = !DILocation(line: 85, column: 21, scope: !112)
!129 = !DILocation(line: 85, column: 30, scope: !112)
!130 = !DILocation(line: 86, column: 25, scope: !131)
!131 = distinct !DILexicalBlock(scope: !112, file: !66, line: 86, column: 17)
!132 = !DILocation(line: 86, column: 40, scope: !131)
!133 = !DILocation(line: 86, column: 17, scope: !131)
!134 = !DILocation(line: 86, column: 85, scope: !131)
!135 = !DILocation(line: 86, column: 17, scope: !112)
!136 = !DILocation(line: 88, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !66, line: 87, column: 13)
!138 = !DILocation(line: 92, column: 31, scope: !112)
!139 = !DILocation(line: 92, column: 46, scope: !112)
!140 = !DILocation(line: 92, column: 26, scope: !112)
!141 = !DILocation(line: 92, column: 24, scope: !112)
!142 = !DILocation(line: 93, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !112, file: !66, line: 93, column: 17)
!144 = !DILocation(line: 93, column: 28, scope: !143)
!145 = !DILocation(line: 93, column: 44, scope: !143)
!146 = !DILocation(line: 93, column: 47, scope: !143)
!147 = !DILocation(line: 93, column: 58, scope: !143)
!148 = !DILocation(line: 93, column: 17, scope: !112)
!149 = !DILocation(line: 95, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !66, line: 94, column: 13)
!151 = !DILocation(line: 98, column: 25, scope: !112)
!152 = !DILocation(line: 98, column: 13, scope: !112)
!153 = !DILocation(line: 98, column: 37, scope: !112)
!154 = !DILocation(line: 100, column: 25, scope: !112)
!155 = !DILocation(line: 100, column: 20, scope: !112)
!156 = !DILocation(line: 100, column: 18, scope: !112)
!157 = !DILocation(line: 101, column: 9, scope: !112)
!158 = !DILocation(line: 103, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !81, file: !66, line: 103, column: 13)
!160 = !DILocation(line: 103, column: 27, scope: !159)
!161 = !DILocation(line: 103, column: 13, scope: !81)
!162 = !DILocation(line: 105, column: 26, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !66, line: 104, column: 9)
!164 = !DILocation(line: 105, column: 13, scope: !163)
!165 = !DILocation(line: 106, column: 9, scope: !163)
!166 = !DILocation(line: 114, column: 28, scope: !65)
!167 = !DILocation(line: 114, column: 14, scope: !65)
!168 = !DILocation(line: 114, column: 26, scope: !65)
!169 = !DILocation(line: 115, column: 5, scope: !65)
!170 = !DILocation(line: 116, column: 1, scope: !65)
!171 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_67_good", scope: !66, file: !66, line: 207, type: !67, scopeLine: 208, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!172 = !DILocation(line: 209, column: 5, scope: !171)
!173 = !DILocation(line: 210, column: 5, scope: !171)
!174 = !DILocation(line: 211, column: 1, scope: !171)
!175 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 222, type: !176, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!176 = !DISubroutineType(types: !177)
!177 = !{!71, !71, !178}
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!180 = !DILocalVariable(name: "argc", arg: 1, scope: !175, file: !66, line: 222, type: !71)
!181 = !DILocation(line: 222, column: 14, scope: !175)
!182 = !DILocalVariable(name: "argv", arg: 2, scope: !175, file: !66, line: 222, type: !178)
!183 = !DILocation(line: 222, column: 27, scope: !175)
!184 = !DILocation(line: 225, column: 22, scope: !175)
!185 = !DILocation(line: 225, column: 12, scope: !175)
!186 = !DILocation(line: 225, column: 5, scope: !175)
!187 = !DILocation(line: 227, column: 5, scope: !175)
!188 = !DILocation(line: 228, column: 5, scope: !175)
!189 = !DILocation(line: 229, column: 5, scope: !175)
!190 = !DILocation(line: 232, column: 5, scope: !175)
!191 = !DILocation(line: 233, column: 5, scope: !175)
!192 = !DILocation(line: 234, column: 5, scope: !175)
!193 = !DILocation(line: 236, column: 5, scope: !175)
!194 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 125, type: !67, scopeLine: 126, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!195 = !DILocalVariable(name: "data", scope: !194, file: !66, line: 127, type: !71)
!196 = !DILocation(line: 127, column: 9, scope: !194)
!197 = !DILocalVariable(name: "myStruct", scope: !194, file: !66, line: 128, type: !74)
!198 = !DILocation(line: 128, column: 78, scope: !194)
!199 = !DILocation(line: 130, column: 10, scope: !194)
!200 = !DILocation(line: 133, column: 10, scope: !194)
!201 = !DILocation(line: 134, column: 28, scope: !194)
!202 = !DILocation(line: 134, column: 14, scope: !194)
!203 = !DILocation(line: 134, column: 26, scope: !194)
!204 = !DILocation(line: 135, column: 5, scope: !194)
!205 = !DILocation(line: 136, column: 1, scope: !194)
!206 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 141, type: !67, scopeLine: 142, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!207 = !DILocalVariable(name: "data", scope: !206, file: !66, line: 143, type: !71)
!208 = !DILocation(line: 143, column: 9, scope: !206)
!209 = !DILocalVariable(name: "myStruct", scope: !206, file: !66, line: 144, type: !74)
!210 = !DILocation(line: 144, column: 78, scope: !206)
!211 = !DILocation(line: 146, column: 10, scope: !206)
!212 = !DILocalVariable(name: "recvResult", scope: !213, file: !66, line: 152, type: !71)
!213 = distinct !DILexicalBlock(scope: !206, file: !66, line: 147, column: 5)
!214 = !DILocation(line: 152, column: 13, scope: !213)
!215 = !DILocalVariable(name: "service", scope: !213, file: !66, line: 153, type: !84)
!216 = !DILocation(line: 153, column: 28, scope: !213)
!217 = !DILocalVariable(name: "connectSocket", scope: !213, file: !66, line: 154, type: !71)
!218 = !DILocation(line: 154, column: 16, scope: !213)
!219 = !DILocalVariable(name: "inputBuffer", scope: !213, file: !66, line: 155, type: !55)
!220 = !DILocation(line: 155, column: 14, scope: !213)
!221 = !DILocation(line: 156, column: 9, scope: !213)
!222 = !DILocation(line: 166, column: 29, scope: !223)
!223 = distinct !DILexicalBlock(scope: !213, file: !66, line: 157, column: 9)
!224 = !DILocation(line: 166, column: 27, scope: !223)
!225 = !DILocation(line: 167, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !66, line: 167, column: 17)
!227 = !DILocation(line: 167, column: 31, scope: !226)
!228 = !DILocation(line: 167, column: 17, scope: !223)
!229 = !DILocation(line: 169, column: 17, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !66, line: 168, column: 13)
!231 = !DILocation(line: 171, column: 13, scope: !223)
!232 = !DILocation(line: 172, column: 21, scope: !223)
!233 = !DILocation(line: 172, column: 32, scope: !223)
!234 = !DILocation(line: 173, column: 39, scope: !223)
!235 = !DILocation(line: 173, column: 21, scope: !223)
!236 = !DILocation(line: 173, column: 30, scope: !223)
!237 = !DILocation(line: 173, column: 37, scope: !223)
!238 = !DILocation(line: 174, column: 32, scope: !223)
!239 = !DILocation(line: 174, column: 21, scope: !223)
!240 = !DILocation(line: 174, column: 30, scope: !223)
!241 = !DILocation(line: 175, column: 25, scope: !242)
!242 = distinct !DILexicalBlock(scope: !223, file: !66, line: 175, column: 17)
!243 = !DILocation(line: 175, column: 40, scope: !242)
!244 = !DILocation(line: 175, column: 17, scope: !242)
!245 = !DILocation(line: 175, column: 85, scope: !242)
!246 = !DILocation(line: 175, column: 17, scope: !223)
!247 = !DILocation(line: 177, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !242, file: !66, line: 176, column: 13)
!249 = !DILocation(line: 181, column: 31, scope: !223)
!250 = !DILocation(line: 181, column: 46, scope: !223)
!251 = !DILocation(line: 181, column: 26, scope: !223)
!252 = !DILocation(line: 181, column: 24, scope: !223)
!253 = !DILocation(line: 182, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !223, file: !66, line: 182, column: 17)
!255 = !DILocation(line: 182, column: 28, scope: !254)
!256 = !DILocation(line: 182, column: 44, scope: !254)
!257 = !DILocation(line: 182, column: 47, scope: !254)
!258 = !DILocation(line: 182, column: 58, scope: !254)
!259 = !DILocation(line: 182, column: 17, scope: !223)
!260 = !DILocation(line: 184, column: 17, scope: !261)
!261 = distinct !DILexicalBlock(scope: !254, file: !66, line: 183, column: 13)
!262 = !DILocation(line: 187, column: 25, scope: !223)
!263 = !DILocation(line: 187, column: 13, scope: !223)
!264 = !DILocation(line: 187, column: 37, scope: !223)
!265 = !DILocation(line: 189, column: 25, scope: !223)
!266 = !DILocation(line: 189, column: 20, scope: !223)
!267 = !DILocation(line: 189, column: 18, scope: !223)
!268 = !DILocation(line: 190, column: 9, scope: !223)
!269 = !DILocation(line: 192, column: 13, scope: !270)
!270 = distinct !DILexicalBlock(scope: !213, file: !66, line: 192, column: 13)
!271 = !DILocation(line: 192, column: 27, scope: !270)
!272 = !DILocation(line: 192, column: 13, scope: !213)
!273 = !DILocation(line: 194, column: 26, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !66, line: 193, column: 9)
!275 = !DILocation(line: 194, column: 13, scope: !274)
!276 = !DILocation(line: 195, column: 9, scope: !274)
!277 = !DILocation(line: 203, column: 28, scope: !206)
!278 = !DILocation(line: 203, column: 14, scope: !206)
!279 = !DILocation(line: 203, column: 26, scope: !206)
!280 = !DILocation(line: 204, column: 5, scope: !206)
!281 = !DILocation(line: 205, column: 1, scope: !206)
