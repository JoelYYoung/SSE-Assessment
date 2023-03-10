; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_34.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType = type { i32 }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_34_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data21 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType* %myUnion, metadata !73, metadata !DIExpression()), !dbg !79
  store i32 -1, i32* %data, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !81, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !84, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %connectSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  br label %do.body, !dbg !111

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !112
  store i32 %call, i32* %connectSocket, align 4, !dbg !114
  %0 = load i32, i32* %connectSocket, align 4, !dbg !115
  %cmp = icmp eq i32 %0, -1, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !119

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !121
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !122
  store i16 2, i16* %sin_family, align 4, !dbg !123
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !124
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !125
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !126
  store i32 %call1, i32* %s_addr, align 4, !dbg !127
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !128
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !129
  store i16 %call2, i16* %sin_port, align 2, !dbg !130
  %2 = load i32, i32* %connectSocket, align 4, !dbg !131
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !133
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !134
  %cmp4 = icmp eq i32 %call3, -1, !dbg !135
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !136

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !137

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !139
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !140
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !141
  %conv = trunc i64 %call7 to i32, !dbg !141
  store i32 %conv, i32* %recvResult, align 4, !dbg !142
  %5 = load i32, i32* %recvResult, align 4, !dbg !143
  %cmp8 = icmp eq i32 %5, -1, !dbg !145
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !146

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !147
  %cmp10 = icmp eq i32 %6, 0, !dbg !148
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !149

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !150

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !152
  %idxprom = sext i32 %7 to i64, !dbg !153
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !153
  store i8 0, i8* %arrayidx, align 1, !dbg !154
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !155
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !156
  store i32 %call15, i32* %data, align 4, !dbg !157
  br label %do.end, !dbg !158

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !159
  %cmp16 = icmp ne i32 %8, -1, !dbg !161
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !162

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !163
  %call19 = call i32 @close(i32 %9), !dbg !165
  br label %if.end20, !dbg !166

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !167
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType* %myUnion to i32*, !dbg !168
  store i32 %10, i32* %unionFirst, align 4, !dbg !169
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !170, metadata !DIExpression()), !dbg !172
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType* %myUnion to i32*, !dbg !173
  %11 = load i32, i32* %unionSecond, align 4, !dbg !173
  store i32 %11, i32* %data21, align 4, !dbg !172
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !174, metadata !DIExpression()), !dbg !179
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !179
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !179
  %13 = load i32, i32* %data21, align 4, !dbg !180
  %cmp22 = icmp slt i32 %13, 10, !dbg !182
  br i1 %cmp22, label %if.then24, label %if.else, !dbg !183

if.then24:                                        ; preds = %if.end20
  %14 = load i32, i32* %data21, align 4, !dbg !184
  %idxprom25 = sext i32 %14 to i64, !dbg !186
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom25, !dbg !186
  %15 = load i32, i32* %arrayidx26, align 4, !dbg !186
  call void @printIntLine(i32 %15), !dbg !187
  br label %if.end27, !dbg !188

if.else:                                          ; preds = %if.end20
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !189
  br label %if.end27

if.end27:                                         ; preds = %if.else, %if.then24
  ret void, !dbg !191
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
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_34_good() #0 !dbg !192 {
entry:
  call void @goodG2B(), !dbg !193
  call void @goodB2G(), !dbg !194
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
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_34_good(), !dbg !209
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !210
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !211
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_34_bad(), !dbg !212
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !213
  ret i32 0, !dbg !214
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !215 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType* %myUnion, metadata !218, metadata !DIExpression()), !dbg !219
  store i32 -1, i32* %data, align 4, !dbg !220
  store i32 7, i32* %data, align 4, !dbg !221
  %0 = load i32, i32* %data, align 4, !dbg !222
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType* %myUnion to i32*, !dbg !223
  store i32 %0, i32* %unionFirst, align 4, !dbg !224
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !225, metadata !DIExpression()), !dbg !227
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType* %myUnion to i32*, !dbg !228
  %1 = load i32, i32* %unionSecond, align 4, !dbg !228
  store i32 %1, i32* %data1, align 4, !dbg !227
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !229, metadata !DIExpression()), !dbg !231
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !231
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !231
  %3 = load i32, i32* %data1, align 4, !dbg !232
  %cmp = icmp slt i32 %3, 10, !dbg !234
  br i1 %cmp, label %if.then, label %if.else, !dbg !235

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !236
  %idxprom = sext i32 %4 to i64, !dbg !238
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !238
  %5 = load i32, i32* %arrayidx, align 4, !dbg !238
  call void @printIntLine(i32 %5), !dbg !239
  br label %if.end, !dbg !240

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !241
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !243
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !244 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data21 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !245, metadata !DIExpression()), !dbg !246
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType* %myUnion, metadata !247, metadata !DIExpression()), !dbg !248
  store i32 -1, i32* %data, align 4, !dbg !249
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !250, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !253, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !255, metadata !DIExpression()), !dbg !256
  store i32 -1, i32* %connectSocket, align 4, !dbg !256
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !257, metadata !DIExpression()), !dbg !258
  br label %do.body, !dbg !259

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !260
  store i32 %call, i32* %connectSocket, align 4, !dbg !262
  %0 = load i32, i32* %connectSocket, align 4, !dbg !263
  %cmp = icmp eq i32 %0, -1, !dbg !265
  br i1 %cmp, label %if.then, label %if.end, !dbg !266

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !267

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !269
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !269
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !270
  store i16 2, i16* %sin_family, align 4, !dbg !271
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !272
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !273
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !274
  store i32 %call1, i32* %s_addr, align 4, !dbg !275
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !276
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !277
  store i16 %call2, i16* %sin_port, align 2, !dbg !278
  %2 = load i32, i32* %connectSocket, align 4, !dbg !279
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !281
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !282
  %cmp4 = icmp eq i32 %call3, -1, !dbg !283
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !284

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !285

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !287
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !288
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !289
  %conv = trunc i64 %call7 to i32, !dbg !289
  store i32 %conv, i32* %recvResult, align 4, !dbg !290
  %5 = load i32, i32* %recvResult, align 4, !dbg !291
  %cmp8 = icmp eq i32 %5, -1, !dbg !293
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !294

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !295
  %cmp10 = icmp eq i32 %6, 0, !dbg !296
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !297

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !298

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !300
  %idxprom = sext i32 %7 to i64, !dbg !301
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !301
  store i8 0, i8* %arrayidx, align 1, !dbg !302
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !303
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !304
  store i32 %call15, i32* %data, align 4, !dbg !305
  br label %do.end, !dbg !306

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !307
  %cmp16 = icmp ne i32 %8, -1, !dbg !309
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !310

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !311
  %call19 = call i32 @close(i32 %9), !dbg !313
  br label %if.end20, !dbg !314

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !315
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType* %myUnion to i32*, !dbg !316
  store i32 %10, i32* %unionFirst, align 4, !dbg !317
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !318, metadata !DIExpression()), !dbg !320
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType* %myUnion to i32*, !dbg !321
  %11 = load i32, i32* %unionSecond, align 4, !dbg !321
  store i32 %11, i32* %data21, align 4, !dbg !320
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !322, metadata !DIExpression()), !dbg !324
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !324
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !324
  %13 = load i32, i32* %data21, align 4, !dbg !325
  %cmp22 = icmp sge i32 %13, 0, !dbg !327
  br i1 %cmp22, label %land.lhs.true, label %if.else, !dbg !328

land.lhs.true:                                    ; preds = %if.end20
  %14 = load i32, i32* %data21, align 4, !dbg !329
  %cmp24 = icmp slt i32 %14, 10, !dbg !330
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !331

if.then26:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data21, align 4, !dbg !332
  %idxprom27 = sext i32 %15 to i64, !dbg !334
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom27, !dbg !334
  %16 = load i32, i32* %arrayidx28, align 4, !dbg !334
  call void @printIntLine(i32 %16), !dbg !335
  br label %if.end29, !dbg !336

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !337
  br label %if.end29

if.end29:                                         ; preds = %if.else, %if.then26
  ret void, !dbg !339
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_34_bad", scope: !66, file: !66, line: 50, type: !67, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_34.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 52, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 52, column: 9, scope: !65)
!73 = !DILocalVariable(name: "myUnion", scope: !65, file: !66, line: 53, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__CWE839_connect_socket_34_unionType", file: !66, line: 46, baseType: !75)
!75 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !66, line: 42, size: 32, elements: !76)
!76 = !{!77, !78}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !75, file: !66, line: 44, baseType: !71, size: 32)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !75, file: !66, line: 45, baseType: !71, size: 32)
!79 = !DILocation(line: 53, column: 65, scope: !65)
!80 = !DILocation(line: 55, column: 10, scope: !65)
!81 = !DILocalVariable(name: "recvResult", scope: !82, file: !66, line: 61, type: !71)
!82 = distinct !DILexicalBlock(scope: !65, file: !66, line: 56, column: 5)
!83 = !DILocation(line: 61, column: 13, scope: !82)
!84 = !DILocalVariable(name: "service", scope: !82, file: !66, line: 62, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !86)
!86 = !{!87, !88, !94, !101}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !85, file: !17, line: 240, baseType: !51, size: 16)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !85, file: !17, line: 241, baseType: !89, size: 16, offset: 16)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !91, line: 25, baseType: !92)
!91 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !93, line: 40, baseType: !53)
!93 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !85, file: !17, line: 242, baseType: !95, size: 32, offset: 32)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !96)
!96 = !{!97}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !95, file: !17, line: 33, baseType: !98, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !91, line: 26, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !93, line: 42, baseType: !5)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !85, file: !17, line: 245, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 62, column: 28, scope: !82)
!107 = !DILocalVariable(name: "connectSocket", scope: !82, file: !66, line: 63, type: !71)
!108 = !DILocation(line: 63, column: 16, scope: !82)
!109 = !DILocalVariable(name: "inputBuffer", scope: !82, file: !66, line: 64, type: !55)
!110 = !DILocation(line: 64, column: 14, scope: !82)
!111 = !DILocation(line: 65, column: 9, scope: !82)
!112 = !DILocation(line: 75, column: 29, scope: !113)
!113 = distinct !DILexicalBlock(scope: !82, file: !66, line: 66, column: 9)
!114 = !DILocation(line: 75, column: 27, scope: !113)
!115 = !DILocation(line: 76, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !66, line: 76, column: 17)
!117 = !DILocation(line: 76, column: 31, scope: !116)
!118 = !DILocation(line: 76, column: 17, scope: !113)
!119 = !DILocation(line: 78, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !66, line: 77, column: 13)
!121 = !DILocation(line: 80, column: 13, scope: !113)
!122 = !DILocation(line: 81, column: 21, scope: !113)
!123 = !DILocation(line: 81, column: 32, scope: !113)
!124 = !DILocation(line: 82, column: 39, scope: !113)
!125 = !DILocation(line: 82, column: 21, scope: !113)
!126 = !DILocation(line: 82, column: 30, scope: !113)
!127 = !DILocation(line: 82, column: 37, scope: !113)
!128 = !DILocation(line: 83, column: 32, scope: !113)
!129 = !DILocation(line: 83, column: 21, scope: !113)
!130 = !DILocation(line: 83, column: 30, scope: !113)
!131 = !DILocation(line: 84, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !113, file: !66, line: 84, column: 17)
!133 = !DILocation(line: 84, column: 40, scope: !132)
!134 = !DILocation(line: 84, column: 17, scope: !132)
!135 = !DILocation(line: 84, column: 85, scope: !132)
!136 = !DILocation(line: 84, column: 17, scope: !113)
!137 = !DILocation(line: 86, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !66, line: 85, column: 13)
!139 = !DILocation(line: 90, column: 31, scope: !113)
!140 = !DILocation(line: 90, column: 46, scope: !113)
!141 = !DILocation(line: 90, column: 26, scope: !113)
!142 = !DILocation(line: 90, column: 24, scope: !113)
!143 = !DILocation(line: 91, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !113, file: !66, line: 91, column: 17)
!145 = !DILocation(line: 91, column: 28, scope: !144)
!146 = !DILocation(line: 91, column: 44, scope: !144)
!147 = !DILocation(line: 91, column: 47, scope: !144)
!148 = !DILocation(line: 91, column: 58, scope: !144)
!149 = !DILocation(line: 91, column: 17, scope: !113)
!150 = !DILocation(line: 93, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !144, file: !66, line: 92, column: 13)
!152 = !DILocation(line: 96, column: 25, scope: !113)
!153 = !DILocation(line: 96, column: 13, scope: !113)
!154 = !DILocation(line: 96, column: 37, scope: !113)
!155 = !DILocation(line: 98, column: 25, scope: !113)
!156 = !DILocation(line: 98, column: 20, scope: !113)
!157 = !DILocation(line: 98, column: 18, scope: !113)
!158 = !DILocation(line: 99, column: 9, scope: !113)
!159 = !DILocation(line: 101, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !82, file: !66, line: 101, column: 13)
!161 = !DILocation(line: 101, column: 27, scope: !160)
!162 = !DILocation(line: 101, column: 13, scope: !82)
!163 = !DILocation(line: 103, column: 26, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !66, line: 102, column: 9)
!165 = !DILocation(line: 103, column: 13, scope: !164)
!166 = !DILocation(line: 104, column: 9, scope: !164)
!167 = !DILocation(line: 112, column: 26, scope: !65)
!168 = !DILocation(line: 112, column: 13, scope: !65)
!169 = !DILocation(line: 112, column: 24, scope: !65)
!170 = !DILocalVariable(name: "data", scope: !171, file: !66, line: 114, type: !71)
!171 = distinct !DILexicalBlock(scope: !65, file: !66, line: 113, column: 5)
!172 = !DILocation(line: 114, column: 13, scope: !171)
!173 = !DILocation(line: 114, column: 28, scope: !171)
!174 = !DILocalVariable(name: "buffer", scope: !175, file: !66, line: 116, type: !176)
!175 = distinct !DILexicalBlock(scope: !171, file: !66, line: 115, column: 9)
!176 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !177)
!177 = !{!178}
!178 = !DISubrange(count: 10)
!179 = !DILocation(line: 116, column: 17, scope: !175)
!180 = !DILocation(line: 119, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !175, file: !66, line: 119, column: 17)
!182 = !DILocation(line: 119, column: 22, scope: !181)
!183 = !DILocation(line: 119, column: 17, scope: !175)
!184 = !DILocation(line: 121, column: 37, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !66, line: 120, column: 13)
!186 = !DILocation(line: 121, column: 30, scope: !185)
!187 = !DILocation(line: 121, column: 17, scope: !185)
!188 = !DILocation(line: 122, column: 13, scope: !185)
!189 = !DILocation(line: 125, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !181, file: !66, line: 124, column: 13)
!191 = !DILocation(line: 129, column: 1, scope: !65)
!192 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_34_good", scope: !66, file: !66, line: 245, type: !67, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!193 = !DILocation(line: 247, column: 5, scope: !192)
!194 = !DILocation(line: 248, column: 5, scope: !192)
!195 = !DILocation(line: 249, column: 1, scope: !192)
!196 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 259, type: !197, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!197 = !DISubroutineType(types: !198)
!198 = !{!71, !71, !199}
!199 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !200, size: 64)
!200 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!201 = !DILocalVariable(name: "argc", arg: 1, scope: !196, file: !66, line: 259, type: !71)
!202 = !DILocation(line: 259, column: 14, scope: !196)
!203 = !DILocalVariable(name: "argv", arg: 2, scope: !196, file: !66, line: 259, type: !199)
!204 = !DILocation(line: 259, column: 27, scope: !196)
!205 = !DILocation(line: 262, column: 22, scope: !196)
!206 = !DILocation(line: 262, column: 12, scope: !196)
!207 = !DILocation(line: 262, column: 5, scope: !196)
!208 = !DILocation(line: 264, column: 5, scope: !196)
!209 = !DILocation(line: 265, column: 5, scope: !196)
!210 = !DILocation(line: 266, column: 5, scope: !196)
!211 = !DILocation(line: 269, column: 5, scope: !196)
!212 = !DILocation(line: 270, column: 5, scope: !196)
!213 = !DILocation(line: 271, column: 5, scope: !196)
!214 = !DILocation(line: 273, column: 5, scope: !196)
!215 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 136, type: !67, scopeLine: 137, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!216 = !DILocalVariable(name: "data", scope: !215, file: !66, line: 138, type: !71)
!217 = !DILocation(line: 138, column: 9, scope: !215)
!218 = !DILocalVariable(name: "myUnion", scope: !215, file: !66, line: 139, type: !74)
!219 = !DILocation(line: 139, column: 65, scope: !215)
!220 = !DILocation(line: 141, column: 10, scope: !215)
!221 = !DILocation(line: 144, column: 10, scope: !215)
!222 = !DILocation(line: 145, column: 26, scope: !215)
!223 = !DILocation(line: 145, column: 13, scope: !215)
!224 = !DILocation(line: 145, column: 24, scope: !215)
!225 = !DILocalVariable(name: "data", scope: !226, file: !66, line: 147, type: !71)
!226 = distinct !DILexicalBlock(scope: !215, file: !66, line: 146, column: 5)
!227 = !DILocation(line: 147, column: 13, scope: !226)
!228 = !DILocation(line: 147, column: 28, scope: !226)
!229 = !DILocalVariable(name: "buffer", scope: !230, file: !66, line: 149, type: !176)
!230 = distinct !DILexicalBlock(scope: !226, file: !66, line: 148, column: 9)
!231 = !DILocation(line: 149, column: 17, scope: !230)
!232 = !DILocation(line: 152, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !230, file: !66, line: 152, column: 17)
!234 = !DILocation(line: 152, column: 22, scope: !233)
!235 = !DILocation(line: 152, column: 17, scope: !230)
!236 = !DILocation(line: 154, column: 37, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !66, line: 153, column: 13)
!238 = !DILocation(line: 154, column: 30, scope: !237)
!239 = !DILocation(line: 154, column: 17, scope: !237)
!240 = !DILocation(line: 155, column: 13, scope: !237)
!241 = !DILocation(line: 158, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !233, file: !66, line: 157, column: 13)
!243 = !DILocation(line: 162, column: 1, scope: !215)
!244 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 165, type: !67, scopeLine: 166, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!245 = !DILocalVariable(name: "data", scope: !244, file: !66, line: 167, type: !71)
!246 = !DILocation(line: 167, column: 9, scope: !244)
!247 = !DILocalVariable(name: "myUnion", scope: !244, file: !66, line: 168, type: !74)
!248 = !DILocation(line: 168, column: 65, scope: !244)
!249 = !DILocation(line: 170, column: 10, scope: !244)
!250 = !DILocalVariable(name: "recvResult", scope: !251, file: !66, line: 176, type: !71)
!251 = distinct !DILexicalBlock(scope: !244, file: !66, line: 171, column: 5)
!252 = !DILocation(line: 176, column: 13, scope: !251)
!253 = !DILocalVariable(name: "service", scope: !251, file: !66, line: 177, type: !85)
!254 = !DILocation(line: 177, column: 28, scope: !251)
!255 = !DILocalVariable(name: "connectSocket", scope: !251, file: !66, line: 178, type: !71)
!256 = !DILocation(line: 178, column: 16, scope: !251)
!257 = !DILocalVariable(name: "inputBuffer", scope: !251, file: !66, line: 179, type: !55)
!258 = !DILocation(line: 179, column: 14, scope: !251)
!259 = !DILocation(line: 180, column: 9, scope: !251)
!260 = !DILocation(line: 190, column: 29, scope: !261)
!261 = distinct !DILexicalBlock(scope: !251, file: !66, line: 181, column: 9)
!262 = !DILocation(line: 190, column: 27, scope: !261)
!263 = !DILocation(line: 191, column: 17, scope: !264)
!264 = distinct !DILexicalBlock(scope: !261, file: !66, line: 191, column: 17)
!265 = !DILocation(line: 191, column: 31, scope: !264)
!266 = !DILocation(line: 191, column: 17, scope: !261)
!267 = !DILocation(line: 193, column: 17, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !66, line: 192, column: 13)
!269 = !DILocation(line: 195, column: 13, scope: !261)
!270 = !DILocation(line: 196, column: 21, scope: !261)
!271 = !DILocation(line: 196, column: 32, scope: !261)
!272 = !DILocation(line: 197, column: 39, scope: !261)
!273 = !DILocation(line: 197, column: 21, scope: !261)
!274 = !DILocation(line: 197, column: 30, scope: !261)
!275 = !DILocation(line: 197, column: 37, scope: !261)
!276 = !DILocation(line: 198, column: 32, scope: !261)
!277 = !DILocation(line: 198, column: 21, scope: !261)
!278 = !DILocation(line: 198, column: 30, scope: !261)
!279 = !DILocation(line: 199, column: 25, scope: !280)
!280 = distinct !DILexicalBlock(scope: !261, file: !66, line: 199, column: 17)
!281 = !DILocation(line: 199, column: 40, scope: !280)
!282 = !DILocation(line: 199, column: 17, scope: !280)
!283 = !DILocation(line: 199, column: 85, scope: !280)
!284 = !DILocation(line: 199, column: 17, scope: !261)
!285 = !DILocation(line: 201, column: 17, scope: !286)
!286 = distinct !DILexicalBlock(scope: !280, file: !66, line: 200, column: 13)
!287 = !DILocation(line: 205, column: 31, scope: !261)
!288 = !DILocation(line: 205, column: 46, scope: !261)
!289 = !DILocation(line: 205, column: 26, scope: !261)
!290 = !DILocation(line: 205, column: 24, scope: !261)
!291 = !DILocation(line: 206, column: 17, scope: !292)
!292 = distinct !DILexicalBlock(scope: !261, file: !66, line: 206, column: 17)
!293 = !DILocation(line: 206, column: 28, scope: !292)
!294 = !DILocation(line: 206, column: 44, scope: !292)
!295 = !DILocation(line: 206, column: 47, scope: !292)
!296 = !DILocation(line: 206, column: 58, scope: !292)
!297 = !DILocation(line: 206, column: 17, scope: !261)
!298 = !DILocation(line: 208, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !292, file: !66, line: 207, column: 13)
!300 = !DILocation(line: 211, column: 25, scope: !261)
!301 = !DILocation(line: 211, column: 13, scope: !261)
!302 = !DILocation(line: 211, column: 37, scope: !261)
!303 = !DILocation(line: 213, column: 25, scope: !261)
!304 = !DILocation(line: 213, column: 20, scope: !261)
!305 = !DILocation(line: 213, column: 18, scope: !261)
!306 = !DILocation(line: 214, column: 9, scope: !261)
!307 = !DILocation(line: 216, column: 13, scope: !308)
!308 = distinct !DILexicalBlock(scope: !251, file: !66, line: 216, column: 13)
!309 = !DILocation(line: 216, column: 27, scope: !308)
!310 = !DILocation(line: 216, column: 13, scope: !251)
!311 = !DILocation(line: 218, column: 26, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !66, line: 217, column: 9)
!313 = !DILocation(line: 218, column: 13, scope: !312)
!314 = !DILocation(line: 219, column: 9, scope: !312)
!315 = !DILocation(line: 227, column: 26, scope: !244)
!316 = !DILocation(line: 227, column: 13, scope: !244)
!317 = !DILocation(line: 227, column: 24, scope: !244)
!318 = !DILocalVariable(name: "data", scope: !319, file: !66, line: 229, type: !71)
!319 = distinct !DILexicalBlock(scope: !244, file: !66, line: 228, column: 5)
!320 = !DILocation(line: 229, column: 13, scope: !319)
!321 = !DILocation(line: 229, column: 28, scope: !319)
!322 = !DILocalVariable(name: "buffer", scope: !323, file: !66, line: 231, type: !176)
!323 = distinct !DILexicalBlock(scope: !319, file: !66, line: 230, column: 9)
!324 = !DILocation(line: 231, column: 17, scope: !323)
!325 = !DILocation(line: 233, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !323, file: !66, line: 233, column: 17)
!327 = !DILocation(line: 233, column: 22, scope: !326)
!328 = !DILocation(line: 233, column: 27, scope: !326)
!329 = !DILocation(line: 233, column: 30, scope: !326)
!330 = !DILocation(line: 233, column: 35, scope: !326)
!331 = !DILocation(line: 233, column: 17, scope: !323)
!332 = !DILocation(line: 235, column: 37, scope: !333)
!333 = distinct !DILexicalBlock(scope: !326, file: !66, line: 234, column: 13)
!334 = !DILocation(line: 235, column: 30, scope: !333)
!335 = !DILocation(line: 235, column: 17, scope: !333)
!336 = !DILocation(line: 236, column: 13, scope: !333)
!337 = !DILocation(line: 239, column: 17, scope: !338)
!338 = distinct !DILexicalBlock(scope: !326, file: !66, line: 238, column: 13)
!339 = !DILocation(line: 243, column: 1, scope: !244)
