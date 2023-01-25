; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_14.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_14_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  %0 = load i32, i32* @globalFive, align 4, !dbg !74
  %cmp = icmp eq i32 %0, 5, !dbg !76
  br i1 %cmp, label %if.then, label %if.end23, !dbg !77

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !78, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !82, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %connectSocket, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  br label %do.body, !dbg !109

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !110
  store i32 %call, i32* %connectSocket, align 4, !dbg !112
  %1 = load i32, i32* %connectSocket, align 4, !dbg !113
  %cmp1 = icmp eq i32 %1, -1, !dbg !115
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !116

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !117

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !119
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !120
  store i16 2, i16* %sin_family, align 4, !dbg !121
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !122
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !123
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !124
  store i32 %call3, i32* %s_addr, align 4, !dbg !125
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !126
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !127
  store i16 %call4, i16* %sin_port, align 2, !dbg !128
  %3 = load i32, i32* %connectSocket, align 4, !dbg !129
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !131
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !132
  %cmp6 = icmp eq i32 %call5, -1, !dbg !133
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !134

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !135

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !137
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !138
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !139
  %conv = trunc i64 %call9 to i32, !dbg !139
  store i32 %conv, i32* %recvResult, align 4, !dbg !140
  %6 = load i32, i32* %recvResult, align 4, !dbg !141
  %cmp10 = icmp eq i32 %6, -1, !dbg !143
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !144

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !145
  %cmp12 = icmp eq i32 %7, 0, !dbg !146
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !147

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !148

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !150
  %idxprom = sext i32 %8 to i64, !dbg !151
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !151
  store i8 0, i8* %arrayidx, align 1, !dbg !152
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !153
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !154
  store i32 %call17, i32* %data, align 4, !dbg !155
  br label %do.end, !dbg !156

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !157
  %cmp18 = icmp ne i32 %9, -1, !dbg !159
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !160

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !161
  %call21 = call i32 @close(i32 %10), !dbg !163
  br label %if.end22, !dbg !164

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !165

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @globalFive, align 4, !dbg !166
  %cmp24 = icmp eq i32 %11, 5, !dbg !168
  br i1 %cmp24, label %if.then26, label %if.end33, !dbg !169

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !170, metadata !DIExpression()), !dbg !176
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !176
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !176
  %13 = load i32, i32* %data, align 4, !dbg !177
  %cmp27 = icmp sge i32 %13, 0, !dbg !179
  br i1 %cmp27, label %if.then29, label %if.else, !dbg !180

if.then29:                                        ; preds = %if.then26
  %14 = load i32, i32* %data, align 4, !dbg !181
  %idxprom30 = sext i32 %14 to i64, !dbg !183
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !183
  %15 = load i32, i32* %arrayidx31, align 4, !dbg !183
  call void @printIntLine(i32 %15), !dbg !184
  br label %if.end32, !dbg !185

if.else:                                          ; preds = %if.then26
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !186
  br label %if.end32

if.end32:                                         ; preds = %if.else, %if.then29
  br label %if.end33, !dbg !188

if.end33:                                         ; preds = %if.end32, %if.end23
  ret void, !dbg !189
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
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_14_good() #0 !dbg !190 {
entry:
  call void @goodB2G1(), !dbg !191
  call void @goodB2G2(), !dbg !192
  call void @goodG2B1(), !dbg !193
  call void @goodG2B2(), !dbg !194
  ret void, !dbg !195
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !196 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !201, metadata !DIExpression()), !dbg !202
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !203, metadata !DIExpression()), !dbg !204
  %call = call i64 @time(i64* null) #7, !dbg !205
  %conv = trunc i64 %call to i32, !dbg !206
  call void @srand(i32 %conv) #7, !dbg !207
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !208
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_14_good(), !dbg !209
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !210
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !211
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_14_bad(), !dbg !212
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !213
  ret i32 0, !dbg !214
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !215 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !216, metadata !DIExpression()), !dbg !217
  store i32 -1, i32* %data, align 4, !dbg !218
  %0 = load i32, i32* @globalFive, align 4, !dbg !219
  %cmp = icmp eq i32 %0, 5, !dbg !221
  br i1 %cmp, label %if.then, label %if.end23, !dbg !222

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !223, metadata !DIExpression()), !dbg !226
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !227, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !229, metadata !DIExpression()), !dbg !230
  store i32 -1, i32* %connectSocket, align 4, !dbg !230
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !231, metadata !DIExpression()), !dbg !232
  br label %do.body, !dbg !233

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !234
  store i32 %call, i32* %connectSocket, align 4, !dbg !236
  %1 = load i32, i32* %connectSocket, align 4, !dbg !237
  %cmp1 = icmp eq i32 %1, -1, !dbg !239
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !240

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !241

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !243
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !243
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !244
  store i16 2, i16* %sin_family, align 4, !dbg !245
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !246
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !247
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !248
  store i32 %call3, i32* %s_addr, align 4, !dbg !249
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !250
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !251
  store i16 %call4, i16* %sin_port, align 2, !dbg !252
  %3 = load i32, i32* %connectSocket, align 4, !dbg !253
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !255
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !256
  %cmp6 = icmp eq i32 %call5, -1, !dbg !257
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !258

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !259

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !261
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !262
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !263
  %conv = trunc i64 %call9 to i32, !dbg !263
  store i32 %conv, i32* %recvResult, align 4, !dbg !264
  %6 = load i32, i32* %recvResult, align 4, !dbg !265
  %cmp10 = icmp eq i32 %6, -1, !dbg !267
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !268

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !269
  %cmp12 = icmp eq i32 %7, 0, !dbg !270
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !271

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !272

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !274
  %idxprom = sext i32 %8 to i64, !dbg !275
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !275
  store i8 0, i8* %arrayidx, align 1, !dbg !276
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !277
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !278
  store i32 %call17, i32* %data, align 4, !dbg !279
  br label %do.end, !dbg !280

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !281
  %cmp18 = icmp ne i32 %9, -1, !dbg !283
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !284

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !285
  %call21 = call i32 @close(i32 %10), !dbg !287
  br label %if.end22, !dbg !288

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !289

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @globalFive, align 4, !dbg !290
  %cmp24 = icmp ne i32 %11, 5, !dbg !292
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !293

if.then26:                                        ; preds = %if.end23
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !294
  br label %if.end36, !dbg !296

if.else:                                          ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !297, metadata !DIExpression()), !dbg !300
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !300
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !300
  %13 = load i32, i32* %data, align 4, !dbg !301
  %cmp27 = icmp sge i32 %13, 0, !dbg !303
  br i1 %cmp27, label %land.lhs.true, label %if.else34, !dbg !304

land.lhs.true:                                    ; preds = %if.else
  %14 = load i32, i32* %data, align 4, !dbg !305
  %cmp29 = icmp slt i32 %14, 10, !dbg !306
  br i1 %cmp29, label %if.then31, label %if.else34, !dbg !307

if.then31:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !308
  %idxprom32 = sext i32 %15 to i64, !dbg !310
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !310
  %16 = load i32, i32* %arrayidx33, align 4, !dbg !310
  call void @printIntLine(i32 %16), !dbg !311
  br label %if.end35, !dbg !312

if.else34:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !313
  br label %if.end35

if.end35:                                         ; preds = %if.else34, %if.then31
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then26
  ret void, !dbg !315
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !316 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !317, metadata !DIExpression()), !dbg !318
  store i32 -1, i32* %data, align 4, !dbg !319
  %0 = load i32, i32* @globalFive, align 4, !dbg !320
  %cmp = icmp eq i32 %0, 5, !dbg !322
  br i1 %cmp, label %if.then, label %if.end23, !dbg !323

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !324, metadata !DIExpression()), !dbg !327
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !328, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !330, metadata !DIExpression()), !dbg !331
  store i32 -1, i32* %connectSocket, align 4, !dbg !331
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !332, metadata !DIExpression()), !dbg !333
  br label %do.body, !dbg !334

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !335
  store i32 %call, i32* %connectSocket, align 4, !dbg !337
  %1 = load i32, i32* %connectSocket, align 4, !dbg !338
  %cmp1 = icmp eq i32 %1, -1, !dbg !340
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !341

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !342

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !344
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !344
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !345
  store i16 2, i16* %sin_family, align 4, !dbg !346
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !347
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !348
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !349
  store i32 %call3, i32* %s_addr, align 4, !dbg !350
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !351
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !352
  store i16 %call4, i16* %sin_port, align 2, !dbg !353
  %3 = load i32, i32* %connectSocket, align 4, !dbg !354
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !356
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !357
  %cmp6 = icmp eq i32 %call5, -1, !dbg !358
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !359

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !360

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !362
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !363
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !364
  %conv = trunc i64 %call9 to i32, !dbg !364
  store i32 %conv, i32* %recvResult, align 4, !dbg !365
  %6 = load i32, i32* %recvResult, align 4, !dbg !366
  %cmp10 = icmp eq i32 %6, -1, !dbg !368
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !369

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !370
  %cmp12 = icmp eq i32 %7, 0, !dbg !371
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !372

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !373

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !375
  %idxprom = sext i32 %8 to i64, !dbg !376
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !376
  store i8 0, i8* %arrayidx, align 1, !dbg !377
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !378
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !379
  store i32 %call17, i32* %data, align 4, !dbg !380
  br label %do.end, !dbg !381

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !382
  %cmp18 = icmp ne i32 %9, -1, !dbg !384
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !385

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !386
  %call21 = call i32 @close(i32 %10), !dbg !388
  br label %if.end22, !dbg !389

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !390

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @globalFive, align 4, !dbg !391
  %cmp24 = icmp eq i32 %11, 5, !dbg !393
  br i1 %cmp24, label %if.then26, label %if.end35, !dbg !394

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !395, metadata !DIExpression()), !dbg !398
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !398
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !398
  %13 = load i32, i32* %data, align 4, !dbg !399
  %cmp27 = icmp sge i32 %13, 0, !dbg !401
  br i1 %cmp27, label %land.lhs.true, label %if.else, !dbg !402

land.lhs.true:                                    ; preds = %if.then26
  %14 = load i32, i32* %data, align 4, !dbg !403
  %cmp29 = icmp slt i32 %14, 10, !dbg !404
  br i1 %cmp29, label %if.then31, label %if.else, !dbg !405

if.then31:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !406
  %idxprom32 = sext i32 %15 to i64, !dbg !408
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !408
  %16 = load i32, i32* %arrayidx33, align 4, !dbg !408
  call void @printIntLine(i32 %16), !dbg !409
  br label %if.end34, !dbg !410

if.else:                                          ; preds = %land.lhs.true, %if.then26
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !411
  br label %if.end34

if.end34:                                         ; preds = %if.else, %if.then31
  br label %if.end35, !dbg !413

if.end35:                                         ; preds = %if.end34, %if.end23
  ret void, !dbg !414
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !415 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !416, metadata !DIExpression()), !dbg !417
  store i32 -1, i32* %data, align 4, !dbg !418
  %0 = load i32, i32* @globalFive, align 4, !dbg !419
  %cmp = icmp ne i32 %0, 5, !dbg !421
  br i1 %cmp, label %if.then, label %if.else, !dbg !422

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !423
  br label %if.end, !dbg !425

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !426
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalFive, align 4, !dbg !428
  %cmp1 = icmp eq i32 %1, 5, !dbg !430
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !431

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !432, metadata !DIExpression()), !dbg !435
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !435
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !435
  %3 = load i32, i32* %data, align 4, !dbg !436
  %cmp3 = icmp sge i32 %3, 0, !dbg !438
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !439

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !440
  %idxprom = sext i32 %4 to i64, !dbg !442
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !442
  %5 = load i32, i32* %arrayidx, align 4, !dbg !442
  call void @printIntLine(i32 %5), !dbg !443
  br label %if.end6, !dbg !444

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !445
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !447

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !448
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !449 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !450, metadata !DIExpression()), !dbg !451
  store i32 -1, i32* %data, align 4, !dbg !452
  %0 = load i32, i32* @globalFive, align 4, !dbg !453
  %cmp = icmp eq i32 %0, 5, !dbg !455
  br i1 %cmp, label %if.then, label %if.end, !dbg !456

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !457
  br label %if.end, !dbg !459

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !460
  %cmp1 = icmp eq i32 %1, 5, !dbg !462
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !463

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !464, metadata !DIExpression()), !dbg !467
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !467
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !467
  %3 = load i32, i32* %data, align 4, !dbg !468
  %cmp3 = icmp sge i32 %3, 0, !dbg !470
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !471

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !472
  %idxprom = sext i32 %4 to i64, !dbg !474
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !474
  %5 = load i32, i32* %arrayidx, align 4, !dbg !474
  call void @printIntLine(i32 %5), !dbg !475
  br label %if.end5, !dbg !476

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !477
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !479

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !480
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_14_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_14.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocation(line: 49, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !65, file: !66, line: 49, column: 8)
!76 = !DILocation(line: 49, column: 18, scope: !75)
!77 = !DILocation(line: 49, column: 8, scope: !65)
!78 = !DILocalVariable(name: "recvResult", scope: !79, file: !66, line: 56, type: !71)
!79 = distinct !DILexicalBlock(scope: !80, file: !66, line: 51, column: 9)
!80 = distinct !DILexicalBlock(scope: !75, file: !66, line: 50, column: 5)
!81 = !DILocation(line: 56, column: 17, scope: !79)
!82 = !DILocalVariable(name: "service", scope: !79, file: !66, line: 57, type: !83)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !84)
!84 = !{!85, !86, !92, !99}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !83, file: !17, line: 240, baseType: !51, size: 16)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !83, file: !17, line: 241, baseType: !87, size: 16, offset: 16)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !89, line: 25, baseType: !90)
!89 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !91, line: 40, baseType: !53)
!91 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !83, file: !17, line: 242, baseType: !93, size: 32, offset: 32)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !94)
!94 = !{!95}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !93, file: !17, line: 33, baseType: !96, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !89, line: 26, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !91, line: 42, baseType: !5)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !83, file: !17, line: 245, baseType: !100, size: 64, offset: 64)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !101, size: 64, elements: !102)
!101 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!102 = !{!103}
!103 = !DISubrange(count: 8)
!104 = !DILocation(line: 57, column: 32, scope: !79)
!105 = !DILocalVariable(name: "connectSocket", scope: !79, file: !66, line: 58, type: !71)
!106 = !DILocation(line: 58, column: 20, scope: !79)
!107 = !DILocalVariable(name: "inputBuffer", scope: !79, file: !66, line: 59, type: !55)
!108 = !DILocation(line: 59, column: 18, scope: !79)
!109 = !DILocation(line: 60, column: 13, scope: !79)
!110 = !DILocation(line: 70, column: 33, scope: !111)
!111 = distinct !DILexicalBlock(scope: !79, file: !66, line: 61, column: 13)
!112 = !DILocation(line: 70, column: 31, scope: !111)
!113 = !DILocation(line: 71, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !66, line: 71, column: 21)
!115 = !DILocation(line: 71, column: 35, scope: !114)
!116 = !DILocation(line: 71, column: 21, scope: !111)
!117 = !DILocation(line: 73, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !66, line: 72, column: 17)
!119 = !DILocation(line: 75, column: 17, scope: !111)
!120 = !DILocation(line: 76, column: 25, scope: !111)
!121 = !DILocation(line: 76, column: 36, scope: !111)
!122 = !DILocation(line: 77, column: 43, scope: !111)
!123 = !DILocation(line: 77, column: 25, scope: !111)
!124 = !DILocation(line: 77, column: 34, scope: !111)
!125 = !DILocation(line: 77, column: 41, scope: !111)
!126 = !DILocation(line: 78, column: 36, scope: !111)
!127 = !DILocation(line: 78, column: 25, scope: !111)
!128 = !DILocation(line: 78, column: 34, scope: !111)
!129 = !DILocation(line: 79, column: 29, scope: !130)
!130 = distinct !DILexicalBlock(scope: !111, file: !66, line: 79, column: 21)
!131 = !DILocation(line: 79, column: 44, scope: !130)
!132 = !DILocation(line: 79, column: 21, scope: !130)
!133 = !DILocation(line: 79, column: 89, scope: !130)
!134 = !DILocation(line: 79, column: 21, scope: !111)
!135 = !DILocation(line: 81, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !66, line: 80, column: 17)
!137 = !DILocation(line: 85, column: 35, scope: !111)
!138 = !DILocation(line: 85, column: 50, scope: !111)
!139 = !DILocation(line: 85, column: 30, scope: !111)
!140 = !DILocation(line: 85, column: 28, scope: !111)
!141 = !DILocation(line: 86, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !111, file: !66, line: 86, column: 21)
!143 = !DILocation(line: 86, column: 32, scope: !142)
!144 = !DILocation(line: 86, column: 48, scope: !142)
!145 = !DILocation(line: 86, column: 51, scope: !142)
!146 = !DILocation(line: 86, column: 62, scope: !142)
!147 = !DILocation(line: 86, column: 21, scope: !111)
!148 = !DILocation(line: 88, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !142, file: !66, line: 87, column: 17)
!150 = !DILocation(line: 91, column: 29, scope: !111)
!151 = !DILocation(line: 91, column: 17, scope: !111)
!152 = !DILocation(line: 91, column: 41, scope: !111)
!153 = !DILocation(line: 93, column: 29, scope: !111)
!154 = !DILocation(line: 93, column: 24, scope: !111)
!155 = !DILocation(line: 93, column: 22, scope: !111)
!156 = !DILocation(line: 94, column: 13, scope: !111)
!157 = !DILocation(line: 96, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !79, file: !66, line: 96, column: 17)
!159 = !DILocation(line: 96, column: 31, scope: !158)
!160 = !DILocation(line: 96, column: 17, scope: !79)
!161 = !DILocation(line: 98, column: 30, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !66, line: 97, column: 13)
!163 = !DILocation(line: 98, column: 17, scope: !162)
!164 = !DILocation(line: 99, column: 13, scope: !162)
!165 = !DILocation(line: 107, column: 5, scope: !80)
!166 = !DILocation(line: 108, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !65, file: !66, line: 108, column: 8)
!168 = !DILocation(line: 108, column: 18, scope: !167)
!169 = !DILocation(line: 108, column: 8, scope: !65)
!170 = !DILocalVariable(name: "buffer", scope: !171, file: !66, line: 111, type: !173)
!171 = distinct !DILexicalBlock(scope: !172, file: !66, line: 110, column: 9)
!172 = distinct !DILexicalBlock(scope: !167, file: !66, line: 109, column: 5)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !174)
!174 = !{!175}
!175 = !DISubrange(count: 10)
!176 = !DILocation(line: 111, column: 17, scope: !171)
!177 = !DILocation(line: 114, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !171, file: !66, line: 114, column: 17)
!179 = !DILocation(line: 114, column: 22, scope: !178)
!180 = !DILocation(line: 114, column: 17, scope: !171)
!181 = !DILocation(line: 116, column: 37, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !66, line: 115, column: 13)
!183 = !DILocation(line: 116, column: 30, scope: !182)
!184 = !DILocation(line: 116, column: 17, scope: !182)
!185 = !DILocation(line: 117, column: 13, scope: !182)
!186 = !DILocation(line: 120, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !178, file: !66, line: 119, column: 13)
!188 = !DILocation(line: 123, column: 5, scope: !172)
!189 = !DILocation(line: 124, column: 1, scope: !65)
!190 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_14_good", scope: !66, file: !66, line: 364, type: !67, scopeLine: 365, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!191 = !DILocation(line: 366, column: 5, scope: !190)
!192 = !DILocation(line: 367, column: 5, scope: !190)
!193 = !DILocation(line: 368, column: 5, scope: !190)
!194 = !DILocation(line: 369, column: 5, scope: !190)
!195 = !DILocation(line: 370, column: 1, scope: !190)
!196 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 381, type: !197, scopeLine: 382, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!197 = !DISubroutineType(types: !198)
!198 = !{!71, !71, !199}
!199 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !200, size: 64)
!200 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!201 = !DILocalVariable(name: "argc", arg: 1, scope: !196, file: !66, line: 381, type: !71)
!202 = !DILocation(line: 381, column: 14, scope: !196)
!203 = !DILocalVariable(name: "argv", arg: 2, scope: !196, file: !66, line: 381, type: !199)
!204 = !DILocation(line: 381, column: 27, scope: !196)
!205 = !DILocation(line: 384, column: 22, scope: !196)
!206 = !DILocation(line: 384, column: 12, scope: !196)
!207 = !DILocation(line: 384, column: 5, scope: !196)
!208 = !DILocation(line: 386, column: 5, scope: !196)
!209 = !DILocation(line: 387, column: 5, scope: !196)
!210 = !DILocation(line: 388, column: 5, scope: !196)
!211 = !DILocation(line: 391, column: 5, scope: !196)
!212 = !DILocation(line: 392, column: 5, scope: !196)
!213 = !DILocation(line: 393, column: 5, scope: !196)
!214 = !DILocation(line: 395, column: 5, scope: !196)
!215 = distinct !DISubprogram(name: "goodB2G1", scope: !66, file: !66, line: 131, type: !67, scopeLine: 132, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!216 = !DILocalVariable(name: "data", scope: !215, file: !66, line: 133, type: !71)
!217 = !DILocation(line: 133, column: 9, scope: !215)
!218 = !DILocation(line: 135, column: 10, scope: !215)
!219 = !DILocation(line: 136, column: 8, scope: !220)
!220 = distinct !DILexicalBlock(scope: !215, file: !66, line: 136, column: 8)
!221 = !DILocation(line: 136, column: 18, scope: !220)
!222 = !DILocation(line: 136, column: 8, scope: !215)
!223 = !DILocalVariable(name: "recvResult", scope: !224, file: !66, line: 143, type: !71)
!224 = distinct !DILexicalBlock(scope: !225, file: !66, line: 138, column: 9)
!225 = distinct !DILexicalBlock(scope: !220, file: !66, line: 137, column: 5)
!226 = !DILocation(line: 143, column: 17, scope: !224)
!227 = !DILocalVariable(name: "service", scope: !224, file: !66, line: 144, type: !83)
!228 = !DILocation(line: 144, column: 32, scope: !224)
!229 = !DILocalVariable(name: "connectSocket", scope: !224, file: !66, line: 145, type: !71)
!230 = !DILocation(line: 145, column: 20, scope: !224)
!231 = !DILocalVariable(name: "inputBuffer", scope: !224, file: !66, line: 146, type: !55)
!232 = !DILocation(line: 146, column: 18, scope: !224)
!233 = !DILocation(line: 147, column: 13, scope: !224)
!234 = !DILocation(line: 157, column: 33, scope: !235)
!235 = distinct !DILexicalBlock(scope: !224, file: !66, line: 148, column: 13)
!236 = !DILocation(line: 157, column: 31, scope: !235)
!237 = !DILocation(line: 158, column: 21, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !66, line: 158, column: 21)
!239 = !DILocation(line: 158, column: 35, scope: !238)
!240 = !DILocation(line: 158, column: 21, scope: !235)
!241 = !DILocation(line: 160, column: 21, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !66, line: 159, column: 17)
!243 = !DILocation(line: 162, column: 17, scope: !235)
!244 = !DILocation(line: 163, column: 25, scope: !235)
!245 = !DILocation(line: 163, column: 36, scope: !235)
!246 = !DILocation(line: 164, column: 43, scope: !235)
!247 = !DILocation(line: 164, column: 25, scope: !235)
!248 = !DILocation(line: 164, column: 34, scope: !235)
!249 = !DILocation(line: 164, column: 41, scope: !235)
!250 = !DILocation(line: 165, column: 36, scope: !235)
!251 = !DILocation(line: 165, column: 25, scope: !235)
!252 = !DILocation(line: 165, column: 34, scope: !235)
!253 = !DILocation(line: 166, column: 29, scope: !254)
!254 = distinct !DILexicalBlock(scope: !235, file: !66, line: 166, column: 21)
!255 = !DILocation(line: 166, column: 44, scope: !254)
!256 = !DILocation(line: 166, column: 21, scope: !254)
!257 = !DILocation(line: 166, column: 89, scope: !254)
!258 = !DILocation(line: 166, column: 21, scope: !235)
!259 = !DILocation(line: 168, column: 21, scope: !260)
!260 = distinct !DILexicalBlock(scope: !254, file: !66, line: 167, column: 17)
!261 = !DILocation(line: 172, column: 35, scope: !235)
!262 = !DILocation(line: 172, column: 50, scope: !235)
!263 = !DILocation(line: 172, column: 30, scope: !235)
!264 = !DILocation(line: 172, column: 28, scope: !235)
!265 = !DILocation(line: 173, column: 21, scope: !266)
!266 = distinct !DILexicalBlock(scope: !235, file: !66, line: 173, column: 21)
!267 = !DILocation(line: 173, column: 32, scope: !266)
!268 = !DILocation(line: 173, column: 48, scope: !266)
!269 = !DILocation(line: 173, column: 51, scope: !266)
!270 = !DILocation(line: 173, column: 62, scope: !266)
!271 = !DILocation(line: 173, column: 21, scope: !235)
!272 = !DILocation(line: 175, column: 21, scope: !273)
!273 = distinct !DILexicalBlock(scope: !266, file: !66, line: 174, column: 17)
!274 = !DILocation(line: 178, column: 29, scope: !235)
!275 = !DILocation(line: 178, column: 17, scope: !235)
!276 = !DILocation(line: 178, column: 41, scope: !235)
!277 = !DILocation(line: 180, column: 29, scope: !235)
!278 = !DILocation(line: 180, column: 24, scope: !235)
!279 = !DILocation(line: 180, column: 22, scope: !235)
!280 = !DILocation(line: 181, column: 13, scope: !235)
!281 = !DILocation(line: 183, column: 17, scope: !282)
!282 = distinct !DILexicalBlock(scope: !224, file: !66, line: 183, column: 17)
!283 = !DILocation(line: 183, column: 31, scope: !282)
!284 = !DILocation(line: 183, column: 17, scope: !224)
!285 = !DILocation(line: 185, column: 30, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !66, line: 184, column: 13)
!287 = !DILocation(line: 185, column: 17, scope: !286)
!288 = !DILocation(line: 186, column: 13, scope: !286)
!289 = !DILocation(line: 194, column: 5, scope: !225)
!290 = !DILocation(line: 195, column: 8, scope: !291)
!291 = distinct !DILexicalBlock(scope: !215, file: !66, line: 195, column: 8)
!292 = !DILocation(line: 195, column: 18, scope: !291)
!293 = !DILocation(line: 195, column: 8, scope: !215)
!294 = !DILocation(line: 198, column: 9, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !66, line: 196, column: 5)
!296 = !DILocation(line: 199, column: 5, scope: !295)
!297 = !DILocalVariable(name: "buffer", scope: !298, file: !66, line: 203, type: !173)
!298 = distinct !DILexicalBlock(scope: !299, file: !66, line: 202, column: 9)
!299 = distinct !DILexicalBlock(scope: !291, file: !66, line: 201, column: 5)
!300 = !DILocation(line: 203, column: 17, scope: !298)
!301 = !DILocation(line: 205, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !66, line: 205, column: 17)
!303 = !DILocation(line: 205, column: 22, scope: !302)
!304 = !DILocation(line: 205, column: 27, scope: !302)
!305 = !DILocation(line: 205, column: 30, scope: !302)
!306 = !DILocation(line: 205, column: 35, scope: !302)
!307 = !DILocation(line: 205, column: 17, scope: !298)
!308 = !DILocation(line: 207, column: 37, scope: !309)
!309 = distinct !DILexicalBlock(scope: !302, file: !66, line: 206, column: 13)
!310 = !DILocation(line: 207, column: 30, scope: !309)
!311 = !DILocation(line: 207, column: 17, scope: !309)
!312 = !DILocation(line: 208, column: 13, scope: !309)
!313 = !DILocation(line: 211, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !302, file: !66, line: 210, column: 13)
!315 = !DILocation(line: 215, column: 1, scope: !215)
!316 = distinct !DISubprogram(name: "goodB2G2", scope: !66, file: !66, line: 218, type: !67, scopeLine: 219, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!317 = !DILocalVariable(name: "data", scope: !316, file: !66, line: 220, type: !71)
!318 = !DILocation(line: 220, column: 9, scope: !316)
!319 = !DILocation(line: 222, column: 10, scope: !316)
!320 = !DILocation(line: 223, column: 8, scope: !321)
!321 = distinct !DILexicalBlock(scope: !316, file: !66, line: 223, column: 8)
!322 = !DILocation(line: 223, column: 18, scope: !321)
!323 = !DILocation(line: 223, column: 8, scope: !316)
!324 = !DILocalVariable(name: "recvResult", scope: !325, file: !66, line: 230, type: !71)
!325 = distinct !DILexicalBlock(scope: !326, file: !66, line: 225, column: 9)
!326 = distinct !DILexicalBlock(scope: !321, file: !66, line: 224, column: 5)
!327 = !DILocation(line: 230, column: 17, scope: !325)
!328 = !DILocalVariable(name: "service", scope: !325, file: !66, line: 231, type: !83)
!329 = !DILocation(line: 231, column: 32, scope: !325)
!330 = !DILocalVariable(name: "connectSocket", scope: !325, file: !66, line: 232, type: !71)
!331 = !DILocation(line: 232, column: 20, scope: !325)
!332 = !DILocalVariable(name: "inputBuffer", scope: !325, file: !66, line: 233, type: !55)
!333 = !DILocation(line: 233, column: 18, scope: !325)
!334 = !DILocation(line: 234, column: 13, scope: !325)
!335 = !DILocation(line: 244, column: 33, scope: !336)
!336 = distinct !DILexicalBlock(scope: !325, file: !66, line: 235, column: 13)
!337 = !DILocation(line: 244, column: 31, scope: !336)
!338 = !DILocation(line: 245, column: 21, scope: !339)
!339 = distinct !DILexicalBlock(scope: !336, file: !66, line: 245, column: 21)
!340 = !DILocation(line: 245, column: 35, scope: !339)
!341 = !DILocation(line: 245, column: 21, scope: !336)
!342 = !DILocation(line: 247, column: 21, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !66, line: 246, column: 17)
!344 = !DILocation(line: 249, column: 17, scope: !336)
!345 = !DILocation(line: 250, column: 25, scope: !336)
!346 = !DILocation(line: 250, column: 36, scope: !336)
!347 = !DILocation(line: 251, column: 43, scope: !336)
!348 = !DILocation(line: 251, column: 25, scope: !336)
!349 = !DILocation(line: 251, column: 34, scope: !336)
!350 = !DILocation(line: 251, column: 41, scope: !336)
!351 = !DILocation(line: 252, column: 36, scope: !336)
!352 = !DILocation(line: 252, column: 25, scope: !336)
!353 = !DILocation(line: 252, column: 34, scope: !336)
!354 = !DILocation(line: 253, column: 29, scope: !355)
!355 = distinct !DILexicalBlock(scope: !336, file: !66, line: 253, column: 21)
!356 = !DILocation(line: 253, column: 44, scope: !355)
!357 = !DILocation(line: 253, column: 21, scope: !355)
!358 = !DILocation(line: 253, column: 89, scope: !355)
!359 = !DILocation(line: 253, column: 21, scope: !336)
!360 = !DILocation(line: 255, column: 21, scope: !361)
!361 = distinct !DILexicalBlock(scope: !355, file: !66, line: 254, column: 17)
!362 = !DILocation(line: 259, column: 35, scope: !336)
!363 = !DILocation(line: 259, column: 50, scope: !336)
!364 = !DILocation(line: 259, column: 30, scope: !336)
!365 = !DILocation(line: 259, column: 28, scope: !336)
!366 = !DILocation(line: 260, column: 21, scope: !367)
!367 = distinct !DILexicalBlock(scope: !336, file: !66, line: 260, column: 21)
!368 = !DILocation(line: 260, column: 32, scope: !367)
!369 = !DILocation(line: 260, column: 48, scope: !367)
!370 = !DILocation(line: 260, column: 51, scope: !367)
!371 = !DILocation(line: 260, column: 62, scope: !367)
!372 = !DILocation(line: 260, column: 21, scope: !336)
!373 = !DILocation(line: 262, column: 21, scope: !374)
!374 = distinct !DILexicalBlock(scope: !367, file: !66, line: 261, column: 17)
!375 = !DILocation(line: 265, column: 29, scope: !336)
!376 = !DILocation(line: 265, column: 17, scope: !336)
!377 = !DILocation(line: 265, column: 41, scope: !336)
!378 = !DILocation(line: 267, column: 29, scope: !336)
!379 = !DILocation(line: 267, column: 24, scope: !336)
!380 = !DILocation(line: 267, column: 22, scope: !336)
!381 = !DILocation(line: 268, column: 13, scope: !336)
!382 = !DILocation(line: 270, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !325, file: !66, line: 270, column: 17)
!384 = !DILocation(line: 270, column: 31, scope: !383)
!385 = !DILocation(line: 270, column: 17, scope: !325)
!386 = !DILocation(line: 272, column: 30, scope: !387)
!387 = distinct !DILexicalBlock(scope: !383, file: !66, line: 271, column: 13)
!388 = !DILocation(line: 272, column: 17, scope: !387)
!389 = !DILocation(line: 273, column: 13, scope: !387)
!390 = !DILocation(line: 281, column: 5, scope: !326)
!391 = !DILocation(line: 282, column: 8, scope: !392)
!392 = distinct !DILexicalBlock(scope: !316, file: !66, line: 282, column: 8)
!393 = !DILocation(line: 282, column: 18, scope: !392)
!394 = !DILocation(line: 282, column: 8, scope: !316)
!395 = !DILocalVariable(name: "buffer", scope: !396, file: !66, line: 285, type: !173)
!396 = distinct !DILexicalBlock(scope: !397, file: !66, line: 284, column: 9)
!397 = distinct !DILexicalBlock(scope: !392, file: !66, line: 283, column: 5)
!398 = !DILocation(line: 285, column: 17, scope: !396)
!399 = !DILocation(line: 287, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !66, line: 287, column: 17)
!401 = !DILocation(line: 287, column: 22, scope: !400)
!402 = !DILocation(line: 287, column: 27, scope: !400)
!403 = !DILocation(line: 287, column: 30, scope: !400)
!404 = !DILocation(line: 287, column: 35, scope: !400)
!405 = !DILocation(line: 287, column: 17, scope: !396)
!406 = !DILocation(line: 289, column: 37, scope: !407)
!407 = distinct !DILexicalBlock(scope: !400, file: !66, line: 288, column: 13)
!408 = !DILocation(line: 289, column: 30, scope: !407)
!409 = !DILocation(line: 289, column: 17, scope: !407)
!410 = !DILocation(line: 290, column: 13, scope: !407)
!411 = !DILocation(line: 293, column: 17, scope: !412)
!412 = distinct !DILexicalBlock(scope: !400, file: !66, line: 292, column: 13)
!413 = !DILocation(line: 296, column: 5, scope: !397)
!414 = !DILocation(line: 297, column: 1, scope: !316)
!415 = distinct !DISubprogram(name: "goodG2B1", scope: !66, file: !66, line: 300, type: !67, scopeLine: 301, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!416 = !DILocalVariable(name: "data", scope: !415, file: !66, line: 302, type: !71)
!417 = !DILocation(line: 302, column: 9, scope: !415)
!418 = !DILocation(line: 304, column: 10, scope: !415)
!419 = !DILocation(line: 305, column: 8, scope: !420)
!420 = distinct !DILexicalBlock(scope: !415, file: !66, line: 305, column: 8)
!421 = !DILocation(line: 305, column: 18, scope: !420)
!422 = !DILocation(line: 305, column: 8, scope: !415)
!423 = !DILocation(line: 308, column: 9, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !66, line: 306, column: 5)
!425 = !DILocation(line: 309, column: 5, scope: !424)
!426 = !DILocation(line: 314, column: 14, scope: !427)
!427 = distinct !DILexicalBlock(scope: !420, file: !66, line: 311, column: 5)
!428 = !DILocation(line: 316, column: 8, scope: !429)
!429 = distinct !DILexicalBlock(scope: !415, file: !66, line: 316, column: 8)
!430 = !DILocation(line: 316, column: 18, scope: !429)
!431 = !DILocation(line: 316, column: 8, scope: !415)
!432 = !DILocalVariable(name: "buffer", scope: !433, file: !66, line: 319, type: !173)
!433 = distinct !DILexicalBlock(scope: !434, file: !66, line: 318, column: 9)
!434 = distinct !DILexicalBlock(scope: !429, file: !66, line: 317, column: 5)
!435 = !DILocation(line: 319, column: 17, scope: !433)
!436 = !DILocation(line: 322, column: 17, scope: !437)
!437 = distinct !DILexicalBlock(scope: !433, file: !66, line: 322, column: 17)
!438 = !DILocation(line: 322, column: 22, scope: !437)
!439 = !DILocation(line: 322, column: 17, scope: !433)
!440 = !DILocation(line: 324, column: 37, scope: !441)
!441 = distinct !DILexicalBlock(scope: !437, file: !66, line: 323, column: 13)
!442 = !DILocation(line: 324, column: 30, scope: !441)
!443 = !DILocation(line: 324, column: 17, scope: !441)
!444 = !DILocation(line: 325, column: 13, scope: !441)
!445 = !DILocation(line: 328, column: 17, scope: !446)
!446 = distinct !DILexicalBlock(scope: !437, file: !66, line: 327, column: 13)
!447 = !DILocation(line: 331, column: 5, scope: !434)
!448 = !DILocation(line: 332, column: 1, scope: !415)
!449 = distinct !DISubprogram(name: "goodG2B2", scope: !66, file: !66, line: 335, type: !67, scopeLine: 336, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!450 = !DILocalVariable(name: "data", scope: !449, file: !66, line: 337, type: !71)
!451 = !DILocation(line: 337, column: 9, scope: !449)
!452 = !DILocation(line: 339, column: 10, scope: !449)
!453 = !DILocation(line: 340, column: 8, scope: !454)
!454 = distinct !DILexicalBlock(scope: !449, file: !66, line: 340, column: 8)
!455 = !DILocation(line: 340, column: 18, scope: !454)
!456 = !DILocation(line: 340, column: 8, scope: !449)
!457 = !DILocation(line: 344, column: 14, scope: !458)
!458 = distinct !DILexicalBlock(scope: !454, file: !66, line: 341, column: 5)
!459 = !DILocation(line: 345, column: 5, scope: !458)
!460 = !DILocation(line: 346, column: 8, scope: !461)
!461 = distinct !DILexicalBlock(scope: !449, file: !66, line: 346, column: 8)
!462 = !DILocation(line: 346, column: 18, scope: !461)
!463 = !DILocation(line: 346, column: 8, scope: !449)
!464 = !DILocalVariable(name: "buffer", scope: !465, file: !66, line: 349, type: !173)
!465 = distinct !DILexicalBlock(scope: !466, file: !66, line: 348, column: 9)
!466 = distinct !DILexicalBlock(scope: !461, file: !66, line: 347, column: 5)
!467 = !DILocation(line: 349, column: 17, scope: !465)
!468 = !DILocation(line: 352, column: 17, scope: !469)
!469 = distinct !DILexicalBlock(scope: !465, file: !66, line: 352, column: 17)
!470 = !DILocation(line: 352, column: 22, scope: !469)
!471 = !DILocation(line: 352, column: 17, scope: !465)
!472 = !DILocation(line: 354, column: 37, scope: !473)
!473 = distinct !DILexicalBlock(scope: !469, file: !66, line: 353, column: 13)
!474 = !DILocation(line: 354, column: 30, scope: !473)
!475 = !DILocation(line: 354, column: 17, scope: !473)
!476 = !DILocation(line: 355, column: 13, scope: !473)
!477 = !DILocation(line: 358, column: 17, scope: !478)
!478 = distinct !DILexicalBlock(scope: !469, file: !66, line: 357, column: 13)
!479 = !DILocation(line: 361, column: 5, scope: !466)
!480 = !DILocation(line: 362, column: 1, scope: !449)
