; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_01_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !74, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !77, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %connectSocket, align 4, !dbg !101
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  br label %do.body, !dbg !104

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !105
  store i32 %call, i32* %connectSocket, align 4, !dbg !107
  %0 = load i32, i32* %connectSocket, align 4, !dbg !108
  %cmp = icmp eq i32 %0, -1, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !112

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !114
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !115
  store i16 2, i16* %sin_family, align 4, !dbg !116
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !117
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !118
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !119
  store i32 %call1, i32* %s_addr, align 4, !dbg !120
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !121
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !122
  store i16 %call2, i16* %sin_port, align 2, !dbg !123
  %2 = load i32, i32* %connectSocket, align 4, !dbg !124
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !126
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !127
  %cmp4 = icmp eq i32 %call3, -1, !dbg !128
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !129

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !130

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !132
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !133
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !134
  %conv = trunc i64 %call7 to i32, !dbg !134
  store i32 %conv, i32* %recvResult, align 4, !dbg !135
  %5 = load i32, i32* %recvResult, align 4, !dbg !136
  %cmp8 = icmp eq i32 %5, -1, !dbg !138
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !139

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !140
  %cmp10 = icmp eq i32 %6, 0, !dbg !141
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !142

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !143

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !145
  %idxprom = sext i32 %7 to i64, !dbg !146
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !146
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !148
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !149
  store i32 %call15, i32* %data, align 4, !dbg !150
  br label %do.end, !dbg !151

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !152
  %cmp16 = icmp ne i32 %8, -1, !dbg !154
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !155

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !156
  %call19 = call i32 @close(i32 %9), !dbg !158
  br label %if.end20, !dbg !159

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !160, metadata !DIExpression()), !dbg !165
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !165
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !165
  %11 = load i32, i32* %data, align 4, !dbg !166
  %cmp21 = icmp sge i32 %11, 0, !dbg !168
  br i1 %cmp21, label %if.then23, label %if.else, !dbg !169

if.then23:                                        ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !170
  %idxprom24 = sext i32 %12 to i64, !dbg !172
  %arrayidx25 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom24, !dbg !172
  %13 = load i32, i32* %arrayidx25, align 4, !dbg !172
  call void @printIntLine(i32 %13), !dbg !173
  br label %if.end26, !dbg !174

if.else:                                          ; preds = %if.end20
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !175
  br label %if.end26

if.end26:                                         ; preds = %if.else, %if.then23
  ret void, !dbg !177
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

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_01_good() #0 !dbg !178 {
entry:
  call void @goodG2B(), !dbg !179
  call void @goodB2G(), !dbg !180
  ret void, !dbg !181
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !182 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !187, metadata !DIExpression()), !dbg !188
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !189, metadata !DIExpression()), !dbg !190
  %call = call i64 @time(i64* null) #7, !dbg !191
  %conv = trunc i64 %call to i32, !dbg !192
  call void @srand(i32 %conv) #7, !dbg !193
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !194
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_01_good(), !dbg !195
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !196
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !197
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_01_bad(), !dbg !198
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !199
  ret i32 0, !dbg !200
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !201 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !202, metadata !DIExpression()), !dbg !203
  store i32 -1, i32* %data, align 4, !dbg !204
  store i32 7, i32* %data, align 4, !dbg !205
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !206, metadata !DIExpression()), !dbg !208
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !208
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !208
  %1 = load i32, i32* %data, align 4, !dbg !209
  %cmp = icmp sge i32 %1, 0, !dbg !211
  br i1 %cmp, label %if.then, label %if.else, !dbg !212

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !213
  %idxprom = sext i32 %2 to i64, !dbg !215
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !215
  %3 = load i32, i32* %arrayidx, align 4, !dbg !215
  call void @printIntLine(i32 %3), !dbg !216
  br label %if.end, !dbg !217

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !218
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !220
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !221 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !222, metadata !DIExpression()), !dbg !223
  store i32 -1, i32* %data, align 4, !dbg !224
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !225, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !228, metadata !DIExpression()), !dbg !229
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !230, metadata !DIExpression()), !dbg !231
  store i32 -1, i32* %connectSocket, align 4, !dbg !231
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !232, metadata !DIExpression()), !dbg !233
  br label %do.body, !dbg !234

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !235
  store i32 %call, i32* %connectSocket, align 4, !dbg !237
  %0 = load i32, i32* %connectSocket, align 4, !dbg !238
  %cmp = icmp eq i32 %0, -1, !dbg !240
  br i1 %cmp, label %if.then, label %if.end, !dbg !241

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !242

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !244
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !244
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !245
  store i16 2, i16* %sin_family, align 4, !dbg !246
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !247
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !248
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !249
  store i32 %call1, i32* %s_addr, align 4, !dbg !250
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !251
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !252
  store i16 %call2, i16* %sin_port, align 2, !dbg !253
  %2 = load i32, i32* %connectSocket, align 4, !dbg !254
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !256
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !257
  %cmp4 = icmp eq i32 %call3, -1, !dbg !258
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !259

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !260

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !262
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !263
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !264
  %conv = trunc i64 %call7 to i32, !dbg !264
  store i32 %conv, i32* %recvResult, align 4, !dbg !265
  %5 = load i32, i32* %recvResult, align 4, !dbg !266
  %cmp8 = icmp eq i32 %5, -1, !dbg !268
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !269

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !270
  %cmp10 = icmp eq i32 %6, 0, !dbg !271
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !272

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !273

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !275
  %idxprom = sext i32 %7 to i64, !dbg !276
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !276
  store i8 0, i8* %arrayidx, align 1, !dbg !277
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !278
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !279
  store i32 %call15, i32* %data, align 4, !dbg !280
  br label %do.end, !dbg !281

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !282
  %cmp16 = icmp ne i32 %8, -1, !dbg !284
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !285

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !286
  %call19 = call i32 @close(i32 %9), !dbg !288
  br label %if.end20, !dbg !289

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !290, metadata !DIExpression()), !dbg !292
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !292
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !292
  %11 = load i32, i32* %data, align 4, !dbg !293
  %cmp21 = icmp sge i32 %11, 0, !dbg !295
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !296

land.lhs.true:                                    ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !297
  %cmp23 = icmp slt i32 %12, 10, !dbg !298
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !299

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !300
  %idxprom26 = sext i32 %13 to i64, !dbg !302
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !302
  %14 = load i32, i32* %arrayidx27, align 4, !dbg !302
  call void @printIntLine(i32 %14), !dbg !303
  br label %if.end28, !dbg !304

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !305
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then25
  ret void, !dbg !307
}

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_01_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_01.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocalVariable(name: "recvResult", scope: !75, file: !66, line: 54, type: !71)
!75 = distinct !DILexicalBlock(scope: !65, file: !66, line: 49, column: 5)
!76 = !DILocation(line: 54, column: 13, scope: !75)
!77 = !DILocalVariable(name: "service", scope: !75, file: !66, line: 55, type: !78)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !79)
!79 = !{!80, !81, !87, !94}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !78, file: !17, line: 240, baseType: !51, size: 16)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !78, file: !17, line: 241, baseType: !82, size: 16, offset: 16)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !83)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !84, line: 25, baseType: !85)
!84 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !86, line: 40, baseType: !53)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !78, file: !17, line: 242, baseType: !88, size: 32, offset: 32)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !89)
!89 = !{!90}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !88, file: !17, line: 33, baseType: !91, size: 32)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !84, line: 26, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !86, line: 42, baseType: !5)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !78, file: !17, line: 245, baseType: !95, size: 64, offset: 64)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 64, elements: !97)
!96 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!97 = !{!98}
!98 = !DISubrange(count: 8)
!99 = !DILocation(line: 55, column: 28, scope: !75)
!100 = !DILocalVariable(name: "connectSocket", scope: !75, file: !66, line: 56, type: !71)
!101 = !DILocation(line: 56, column: 16, scope: !75)
!102 = !DILocalVariable(name: "inputBuffer", scope: !75, file: !66, line: 57, type: !55)
!103 = !DILocation(line: 57, column: 14, scope: !75)
!104 = !DILocation(line: 58, column: 9, scope: !75)
!105 = !DILocation(line: 68, column: 29, scope: !106)
!106 = distinct !DILexicalBlock(scope: !75, file: !66, line: 59, column: 9)
!107 = !DILocation(line: 68, column: 27, scope: !106)
!108 = !DILocation(line: 69, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !66, line: 69, column: 17)
!110 = !DILocation(line: 69, column: 31, scope: !109)
!111 = !DILocation(line: 69, column: 17, scope: !106)
!112 = !DILocation(line: 71, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !66, line: 70, column: 13)
!114 = !DILocation(line: 73, column: 13, scope: !106)
!115 = !DILocation(line: 74, column: 21, scope: !106)
!116 = !DILocation(line: 74, column: 32, scope: !106)
!117 = !DILocation(line: 75, column: 39, scope: !106)
!118 = !DILocation(line: 75, column: 21, scope: !106)
!119 = !DILocation(line: 75, column: 30, scope: !106)
!120 = !DILocation(line: 75, column: 37, scope: !106)
!121 = !DILocation(line: 76, column: 32, scope: !106)
!122 = !DILocation(line: 76, column: 21, scope: !106)
!123 = !DILocation(line: 76, column: 30, scope: !106)
!124 = !DILocation(line: 77, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !106, file: !66, line: 77, column: 17)
!126 = !DILocation(line: 77, column: 40, scope: !125)
!127 = !DILocation(line: 77, column: 17, scope: !125)
!128 = !DILocation(line: 77, column: 85, scope: !125)
!129 = !DILocation(line: 77, column: 17, scope: !106)
!130 = !DILocation(line: 79, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !66, line: 78, column: 13)
!132 = !DILocation(line: 83, column: 31, scope: !106)
!133 = !DILocation(line: 83, column: 46, scope: !106)
!134 = !DILocation(line: 83, column: 26, scope: !106)
!135 = !DILocation(line: 83, column: 24, scope: !106)
!136 = !DILocation(line: 84, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !106, file: !66, line: 84, column: 17)
!138 = !DILocation(line: 84, column: 28, scope: !137)
!139 = !DILocation(line: 84, column: 44, scope: !137)
!140 = !DILocation(line: 84, column: 47, scope: !137)
!141 = !DILocation(line: 84, column: 58, scope: !137)
!142 = !DILocation(line: 84, column: 17, scope: !106)
!143 = !DILocation(line: 86, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !66, line: 85, column: 13)
!145 = !DILocation(line: 89, column: 25, scope: !106)
!146 = !DILocation(line: 89, column: 13, scope: !106)
!147 = !DILocation(line: 89, column: 37, scope: !106)
!148 = !DILocation(line: 91, column: 25, scope: !106)
!149 = !DILocation(line: 91, column: 20, scope: !106)
!150 = !DILocation(line: 91, column: 18, scope: !106)
!151 = !DILocation(line: 92, column: 9, scope: !106)
!152 = !DILocation(line: 94, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !75, file: !66, line: 94, column: 13)
!154 = !DILocation(line: 94, column: 27, scope: !153)
!155 = !DILocation(line: 94, column: 13, scope: !75)
!156 = !DILocation(line: 96, column: 26, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !66, line: 95, column: 9)
!158 = !DILocation(line: 96, column: 13, scope: !157)
!159 = !DILocation(line: 97, column: 9, scope: !157)
!160 = !DILocalVariable(name: "buffer", scope: !161, file: !66, line: 106, type: !162)
!161 = distinct !DILexicalBlock(scope: !65, file: !66, line: 105, column: 5)
!162 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !163)
!163 = !{!164}
!164 = !DISubrange(count: 10)
!165 = !DILocation(line: 106, column: 13, scope: !161)
!166 = !DILocation(line: 109, column: 13, scope: !167)
!167 = distinct !DILexicalBlock(scope: !161, file: !66, line: 109, column: 13)
!168 = !DILocation(line: 109, column: 18, scope: !167)
!169 = !DILocation(line: 109, column: 13, scope: !161)
!170 = !DILocation(line: 111, column: 33, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !66, line: 110, column: 9)
!172 = !DILocation(line: 111, column: 26, scope: !171)
!173 = !DILocation(line: 111, column: 13, scope: !171)
!174 = !DILocation(line: 112, column: 9, scope: !171)
!175 = !DILocation(line: 115, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !167, file: !66, line: 114, column: 9)
!177 = !DILocation(line: 118, column: 1, scope: !65)
!178 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_01_good", scope: !66, file: !66, line: 224, type: !67, scopeLine: 225, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!179 = !DILocation(line: 226, column: 5, scope: !178)
!180 = !DILocation(line: 227, column: 5, scope: !178)
!181 = !DILocation(line: 228, column: 1, scope: !178)
!182 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 239, type: !183, scopeLine: 240, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!183 = !DISubroutineType(types: !184)
!184 = !{!71, !71, !185}
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!187 = !DILocalVariable(name: "argc", arg: 1, scope: !182, file: !66, line: 239, type: !71)
!188 = !DILocation(line: 239, column: 14, scope: !182)
!189 = !DILocalVariable(name: "argv", arg: 2, scope: !182, file: !66, line: 239, type: !185)
!190 = !DILocation(line: 239, column: 27, scope: !182)
!191 = !DILocation(line: 242, column: 22, scope: !182)
!192 = !DILocation(line: 242, column: 12, scope: !182)
!193 = !DILocation(line: 242, column: 5, scope: !182)
!194 = !DILocation(line: 244, column: 5, scope: !182)
!195 = !DILocation(line: 245, column: 5, scope: !182)
!196 = !DILocation(line: 246, column: 5, scope: !182)
!197 = !DILocation(line: 249, column: 5, scope: !182)
!198 = !DILocation(line: 250, column: 5, scope: !182)
!199 = !DILocation(line: 251, column: 5, scope: !182)
!200 = !DILocation(line: 253, column: 5, scope: !182)
!201 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 125, type: !67, scopeLine: 126, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!202 = !DILocalVariable(name: "data", scope: !201, file: !66, line: 127, type: !71)
!203 = !DILocation(line: 127, column: 9, scope: !201)
!204 = !DILocation(line: 129, column: 10, scope: !201)
!205 = !DILocation(line: 132, column: 10, scope: !201)
!206 = !DILocalVariable(name: "buffer", scope: !207, file: !66, line: 134, type: !162)
!207 = distinct !DILexicalBlock(scope: !201, file: !66, line: 133, column: 5)
!208 = !DILocation(line: 134, column: 13, scope: !207)
!209 = !DILocation(line: 137, column: 13, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !66, line: 137, column: 13)
!211 = !DILocation(line: 137, column: 18, scope: !210)
!212 = !DILocation(line: 137, column: 13, scope: !207)
!213 = !DILocation(line: 139, column: 33, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !66, line: 138, column: 9)
!215 = !DILocation(line: 139, column: 26, scope: !214)
!216 = !DILocation(line: 139, column: 13, scope: !214)
!217 = !DILocation(line: 140, column: 9, scope: !214)
!218 = !DILocation(line: 143, column: 13, scope: !219)
!219 = distinct !DILexicalBlock(scope: !210, file: !66, line: 142, column: 9)
!220 = !DILocation(line: 146, column: 1, scope: !201)
!221 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 149, type: !67, scopeLine: 150, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!222 = !DILocalVariable(name: "data", scope: !221, file: !66, line: 151, type: !71)
!223 = !DILocation(line: 151, column: 9, scope: !221)
!224 = !DILocation(line: 153, column: 10, scope: !221)
!225 = !DILocalVariable(name: "recvResult", scope: !226, file: !66, line: 159, type: !71)
!226 = distinct !DILexicalBlock(scope: !221, file: !66, line: 154, column: 5)
!227 = !DILocation(line: 159, column: 13, scope: !226)
!228 = !DILocalVariable(name: "service", scope: !226, file: !66, line: 160, type: !78)
!229 = !DILocation(line: 160, column: 28, scope: !226)
!230 = !DILocalVariable(name: "connectSocket", scope: !226, file: !66, line: 161, type: !71)
!231 = !DILocation(line: 161, column: 16, scope: !226)
!232 = !DILocalVariable(name: "inputBuffer", scope: !226, file: !66, line: 162, type: !55)
!233 = !DILocation(line: 162, column: 14, scope: !226)
!234 = !DILocation(line: 163, column: 9, scope: !226)
!235 = !DILocation(line: 173, column: 29, scope: !236)
!236 = distinct !DILexicalBlock(scope: !226, file: !66, line: 164, column: 9)
!237 = !DILocation(line: 173, column: 27, scope: !236)
!238 = !DILocation(line: 174, column: 17, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !66, line: 174, column: 17)
!240 = !DILocation(line: 174, column: 31, scope: !239)
!241 = !DILocation(line: 174, column: 17, scope: !236)
!242 = !DILocation(line: 176, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !66, line: 175, column: 13)
!244 = !DILocation(line: 178, column: 13, scope: !236)
!245 = !DILocation(line: 179, column: 21, scope: !236)
!246 = !DILocation(line: 179, column: 32, scope: !236)
!247 = !DILocation(line: 180, column: 39, scope: !236)
!248 = !DILocation(line: 180, column: 21, scope: !236)
!249 = !DILocation(line: 180, column: 30, scope: !236)
!250 = !DILocation(line: 180, column: 37, scope: !236)
!251 = !DILocation(line: 181, column: 32, scope: !236)
!252 = !DILocation(line: 181, column: 21, scope: !236)
!253 = !DILocation(line: 181, column: 30, scope: !236)
!254 = !DILocation(line: 182, column: 25, scope: !255)
!255 = distinct !DILexicalBlock(scope: !236, file: !66, line: 182, column: 17)
!256 = !DILocation(line: 182, column: 40, scope: !255)
!257 = !DILocation(line: 182, column: 17, scope: !255)
!258 = !DILocation(line: 182, column: 85, scope: !255)
!259 = !DILocation(line: 182, column: 17, scope: !236)
!260 = !DILocation(line: 184, column: 17, scope: !261)
!261 = distinct !DILexicalBlock(scope: !255, file: !66, line: 183, column: 13)
!262 = !DILocation(line: 188, column: 31, scope: !236)
!263 = !DILocation(line: 188, column: 46, scope: !236)
!264 = !DILocation(line: 188, column: 26, scope: !236)
!265 = !DILocation(line: 188, column: 24, scope: !236)
!266 = !DILocation(line: 189, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !236, file: !66, line: 189, column: 17)
!268 = !DILocation(line: 189, column: 28, scope: !267)
!269 = !DILocation(line: 189, column: 44, scope: !267)
!270 = !DILocation(line: 189, column: 47, scope: !267)
!271 = !DILocation(line: 189, column: 58, scope: !267)
!272 = !DILocation(line: 189, column: 17, scope: !236)
!273 = !DILocation(line: 191, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !267, file: !66, line: 190, column: 13)
!275 = !DILocation(line: 194, column: 25, scope: !236)
!276 = !DILocation(line: 194, column: 13, scope: !236)
!277 = !DILocation(line: 194, column: 37, scope: !236)
!278 = !DILocation(line: 196, column: 25, scope: !236)
!279 = !DILocation(line: 196, column: 20, scope: !236)
!280 = !DILocation(line: 196, column: 18, scope: !236)
!281 = !DILocation(line: 197, column: 9, scope: !236)
!282 = !DILocation(line: 199, column: 13, scope: !283)
!283 = distinct !DILexicalBlock(scope: !226, file: !66, line: 199, column: 13)
!284 = !DILocation(line: 199, column: 27, scope: !283)
!285 = !DILocation(line: 199, column: 13, scope: !226)
!286 = !DILocation(line: 201, column: 26, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !66, line: 200, column: 9)
!288 = !DILocation(line: 201, column: 13, scope: !287)
!289 = !DILocation(line: 202, column: 9, scope: !287)
!290 = !DILocalVariable(name: "buffer", scope: !291, file: !66, line: 211, type: !162)
!291 = distinct !DILexicalBlock(scope: !221, file: !66, line: 210, column: 5)
!292 = !DILocation(line: 211, column: 13, scope: !291)
!293 = !DILocation(line: 213, column: 13, scope: !294)
!294 = distinct !DILexicalBlock(scope: !291, file: !66, line: 213, column: 13)
!295 = !DILocation(line: 213, column: 18, scope: !294)
!296 = !DILocation(line: 213, column: 23, scope: !294)
!297 = !DILocation(line: 213, column: 26, scope: !294)
!298 = !DILocation(line: 213, column: 31, scope: !294)
!299 = !DILocation(line: 213, column: 13, scope: !291)
!300 = !DILocation(line: 215, column: 33, scope: !301)
!301 = distinct !DILexicalBlock(scope: !294, file: !66, line: 214, column: 9)
!302 = !DILocation(line: 215, column: 26, scope: !301)
!303 = !DILocation(line: 215, column: 13, scope: !301)
!304 = !DILocation(line: 216, column: 9, scope: !301)
!305 = !DILocation(line: 219, column: 13, scope: !306)
!306 = distinct !DILexicalBlock(scope: !294, file: !66, line: 218, column: 9)
!307 = !DILocation(line: 222, column: 1, scope: !221)
