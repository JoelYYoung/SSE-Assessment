; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_16.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_16.c"
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
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_16_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  br label %while.body, !dbg !74

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !75, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !79, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %connectSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  br label %do.body, !dbg !106

do.body:                                          ; preds = %while.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !107
  store i32 %call, i32* %connectSocket, align 4, !dbg !109
  %0 = load i32, i32* %connectSocket, align 4, !dbg !110
  %cmp = icmp eq i32 %0, -1, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !114

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !116
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !117
  store i16 2, i16* %sin_family, align 4, !dbg !118
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !119
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !120
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !121
  store i32 %call1, i32* %s_addr, align 4, !dbg !122
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !123
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !124
  store i16 %call2, i16* %sin_port, align 2, !dbg !125
  %2 = load i32, i32* %connectSocket, align 4, !dbg !126
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !128
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !129
  %cmp4 = icmp eq i32 %call3, -1, !dbg !130
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !131

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !132

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !134
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !135
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !136
  %conv = trunc i64 %call7 to i32, !dbg !136
  store i32 %conv, i32* %recvResult, align 4, !dbg !137
  %5 = load i32, i32* %recvResult, align 4, !dbg !138
  %cmp8 = icmp eq i32 %5, -1, !dbg !140
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !141

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !142
  %cmp10 = icmp eq i32 %6, 0, !dbg !143
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !144

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !145

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !147
  %idxprom = sext i32 %7 to i64, !dbg !148
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !150
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !151
  store i32 %call15, i32* %data, align 4, !dbg !152
  br label %do.end, !dbg !153

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !154
  %cmp16 = icmp ne i32 %8, -1, !dbg !156
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !157

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !158
  %call19 = call i32 @close(i32 %9), !dbg !160
  br label %if.end20, !dbg !161

if.end20:                                         ; preds = %if.then18, %do.end
  br label %while.end, !dbg !162

while.end:                                        ; preds = %if.end20
  br label %while.body21, !dbg !163

while.body21:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !164, metadata !DIExpression()), !dbg !170
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !170
  %11 = load i32, i32* %data, align 4, !dbg !171
  %cmp22 = icmp sge i32 %11, 0, !dbg !173
  br i1 %cmp22, label %if.then24, label %if.else, !dbg !174

if.then24:                                        ; preds = %while.body21
  %12 = load i32, i32* %data, align 4, !dbg !175
  %idxprom25 = sext i32 %12 to i64, !dbg !177
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom25, !dbg !177
  %13 = load i32, i32* %arrayidx26, align 4, !dbg !177
  call void @printIntLine(i32 %13), !dbg !178
  br label %if.end27, !dbg !179

if.else:                                          ; preds = %while.body21
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !180
  br label %if.end27

if.end27:                                         ; preds = %if.else, %if.then24
  br label %while.end28, !dbg !182

while.end28:                                      ; preds = %if.end27
  ret void, !dbg !183
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
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_16_good() #0 !dbg !184 {
entry:
  call void @goodB2G(), !dbg !185
  call void @goodG2B(), !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !188 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !193, metadata !DIExpression()), !dbg !194
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !195, metadata !DIExpression()), !dbg !196
  %call = call i64 @time(i64* null) #7, !dbg !197
  %conv = trunc i64 %call to i32, !dbg !198
  call void @srand(i32 %conv) #7, !dbg !199
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !200
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_16_good(), !dbg !201
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !202
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !203
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_16_bad(), !dbg !204
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !205
  ret i32 0, !dbg !206
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !207 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !208, metadata !DIExpression()), !dbg !209
  store i32 -1, i32* %data, align 4, !dbg !210
  br label %while.body, !dbg !211

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !212, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !218, metadata !DIExpression()), !dbg !219
  store i32 -1, i32* %connectSocket, align 4, !dbg !219
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !220, metadata !DIExpression()), !dbg !221
  br label %do.body, !dbg !222

do.body:                                          ; preds = %while.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !223
  store i32 %call, i32* %connectSocket, align 4, !dbg !225
  %0 = load i32, i32* %connectSocket, align 4, !dbg !226
  %cmp = icmp eq i32 %0, -1, !dbg !228
  br i1 %cmp, label %if.then, label %if.end, !dbg !229

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !230

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !232
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !232
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !233
  store i16 2, i16* %sin_family, align 4, !dbg !234
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !235
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !236
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !237
  store i32 %call1, i32* %s_addr, align 4, !dbg !238
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !239
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !240
  store i16 %call2, i16* %sin_port, align 2, !dbg !241
  %2 = load i32, i32* %connectSocket, align 4, !dbg !242
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !244
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !245
  %cmp4 = icmp eq i32 %call3, -1, !dbg !246
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !247

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !248

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !250
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !251
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !252
  %conv = trunc i64 %call7 to i32, !dbg !252
  store i32 %conv, i32* %recvResult, align 4, !dbg !253
  %5 = load i32, i32* %recvResult, align 4, !dbg !254
  %cmp8 = icmp eq i32 %5, -1, !dbg !256
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !257

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !258
  %cmp10 = icmp eq i32 %6, 0, !dbg !259
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !260

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !261

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !263
  %idxprom = sext i32 %7 to i64, !dbg !264
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !264
  store i8 0, i8* %arrayidx, align 1, !dbg !265
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !266
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !267
  store i32 %call15, i32* %data, align 4, !dbg !268
  br label %do.end, !dbg !269

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !270
  %cmp16 = icmp ne i32 %8, -1, !dbg !272
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !273

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !274
  %call19 = call i32 @close(i32 %9), !dbg !276
  br label %if.end20, !dbg !277

if.end20:                                         ; preds = %if.then18, %do.end
  br label %while.end, !dbg !278

while.end:                                        ; preds = %if.end20
  br label %while.body21, !dbg !279

while.body21:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !280, metadata !DIExpression()), !dbg !283
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !283
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !283
  %11 = load i32, i32* %data, align 4, !dbg !284
  %cmp22 = icmp sge i32 %11, 0, !dbg !286
  br i1 %cmp22, label %land.lhs.true, label %if.else, !dbg !287

land.lhs.true:                                    ; preds = %while.body21
  %12 = load i32, i32* %data, align 4, !dbg !288
  %cmp24 = icmp slt i32 %12, 10, !dbg !289
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !290

if.then26:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !291
  %idxprom27 = sext i32 %13 to i64, !dbg !293
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom27, !dbg !293
  %14 = load i32, i32* %arrayidx28, align 4, !dbg !293
  call void @printIntLine(i32 %14), !dbg !294
  br label %if.end29, !dbg !295

if.else:                                          ; preds = %land.lhs.true, %while.body21
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !296
  br label %if.end29

if.end29:                                         ; preds = %if.else, %if.then26
  br label %while.end30, !dbg !298

while.end30:                                      ; preds = %if.end29
  ret void, !dbg !299
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !300 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !301, metadata !DIExpression()), !dbg !302
  store i32 -1, i32* %data, align 4, !dbg !303
  br label %while.body, !dbg !304

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !305
  br label %while.end, !dbg !307

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !308

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !309, metadata !DIExpression()), !dbg !312
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !312
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !312
  %1 = load i32, i32* %data, align 4, !dbg !313
  %cmp = icmp sge i32 %1, 0, !dbg !315
  br i1 %cmp, label %if.then, label %if.else, !dbg !316

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !317
  %idxprom = sext i32 %2 to i64, !dbg !319
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !319
  %3 = load i32, i32* %arrayidx, align 4, !dbg !319
  call void @printIntLine(i32 %3), !dbg !320
  br label %if.end, !dbg !321

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !322
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end2, !dbg !324

while.end2:                                       ; preds = %if.end
  ret void, !dbg !325
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_16.c", directory: "/root/SSE-Assessment")
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
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !48, line: 175, size: 128, elements: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!49 = !{!50, !54}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !47, file: !48, line: 177, baseType: !51, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !52, line: 28, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !47, file: !48, line: 178, baseType: !55, size: 112, offset: 16)
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
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_16_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_16.c", directory: "/root/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocation(line: 49, column: 5, scope: !65)
!75 = !DILocalVariable(name: "recvResult", scope: !76, file: !66, line: 56, type: !71)
!76 = distinct !DILexicalBlock(scope: !77, file: !66, line: 51, column: 9)
!77 = distinct !DILexicalBlock(scope: !65, file: !66, line: 50, column: 5)
!78 = !DILocation(line: 56, column: 17, scope: !76)
!79 = !DILocalVariable(name: "service", scope: !76, file: !66, line: 57, type: !80)
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !81)
!81 = !{!82, !83, !89, !96}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !80, file: !17, line: 239, baseType: !51, size: 16)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !80, file: !17, line: 240, baseType: !84, size: 16, offset: 16)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !85)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !86, line: 25, baseType: !87)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !88, line: 39, baseType: !53)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !80, file: !17, line: 241, baseType: !90, size: 32, offset: 32)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !91)
!91 = !{!92}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !90, file: !17, line: 33, baseType: !93, size: 32)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !86, line: 26, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !88, line: 41, baseType: !5)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !80, file: !17, line: 244, baseType: !97, size: 64, offset: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 64, elements: !99)
!98 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!99 = !{!100}
!100 = !DISubrange(count: 8)
!101 = !DILocation(line: 57, column: 32, scope: !76)
!102 = !DILocalVariable(name: "connectSocket", scope: !76, file: !66, line: 58, type: !71)
!103 = !DILocation(line: 58, column: 20, scope: !76)
!104 = !DILocalVariable(name: "inputBuffer", scope: !76, file: !66, line: 59, type: !55)
!105 = !DILocation(line: 59, column: 18, scope: !76)
!106 = !DILocation(line: 60, column: 13, scope: !76)
!107 = !DILocation(line: 70, column: 33, scope: !108)
!108 = distinct !DILexicalBlock(scope: !76, file: !66, line: 61, column: 13)
!109 = !DILocation(line: 70, column: 31, scope: !108)
!110 = !DILocation(line: 71, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !66, line: 71, column: 21)
!112 = !DILocation(line: 71, column: 35, scope: !111)
!113 = !DILocation(line: 71, column: 21, scope: !108)
!114 = !DILocation(line: 73, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !66, line: 72, column: 17)
!116 = !DILocation(line: 75, column: 17, scope: !108)
!117 = !DILocation(line: 76, column: 25, scope: !108)
!118 = !DILocation(line: 76, column: 36, scope: !108)
!119 = !DILocation(line: 77, column: 43, scope: !108)
!120 = !DILocation(line: 77, column: 25, scope: !108)
!121 = !DILocation(line: 77, column: 34, scope: !108)
!122 = !DILocation(line: 77, column: 41, scope: !108)
!123 = !DILocation(line: 78, column: 36, scope: !108)
!124 = !DILocation(line: 78, column: 25, scope: !108)
!125 = !DILocation(line: 78, column: 34, scope: !108)
!126 = !DILocation(line: 79, column: 29, scope: !127)
!127 = distinct !DILexicalBlock(scope: !108, file: !66, line: 79, column: 21)
!128 = !DILocation(line: 79, column: 44, scope: !127)
!129 = !DILocation(line: 79, column: 21, scope: !127)
!130 = !DILocation(line: 79, column: 89, scope: !127)
!131 = !DILocation(line: 79, column: 21, scope: !108)
!132 = !DILocation(line: 81, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !66, line: 80, column: 17)
!134 = !DILocation(line: 85, column: 35, scope: !108)
!135 = !DILocation(line: 85, column: 50, scope: !108)
!136 = !DILocation(line: 85, column: 30, scope: !108)
!137 = !DILocation(line: 85, column: 28, scope: !108)
!138 = !DILocation(line: 86, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !108, file: !66, line: 86, column: 21)
!140 = !DILocation(line: 86, column: 32, scope: !139)
!141 = !DILocation(line: 86, column: 48, scope: !139)
!142 = !DILocation(line: 86, column: 51, scope: !139)
!143 = !DILocation(line: 86, column: 62, scope: !139)
!144 = !DILocation(line: 86, column: 21, scope: !108)
!145 = !DILocation(line: 88, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !139, file: !66, line: 87, column: 17)
!147 = !DILocation(line: 91, column: 29, scope: !108)
!148 = !DILocation(line: 91, column: 17, scope: !108)
!149 = !DILocation(line: 91, column: 41, scope: !108)
!150 = !DILocation(line: 93, column: 29, scope: !108)
!151 = !DILocation(line: 93, column: 24, scope: !108)
!152 = !DILocation(line: 93, column: 22, scope: !108)
!153 = !DILocation(line: 94, column: 13, scope: !108)
!154 = !DILocation(line: 96, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !76, file: !66, line: 96, column: 17)
!156 = !DILocation(line: 96, column: 31, scope: !155)
!157 = !DILocation(line: 96, column: 17, scope: !76)
!158 = !DILocation(line: 98, column: 30, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !66, line: 97, column: 13)
!160 = !DILocation(line: 98, column: 17, scope: !159)
!161 = !DILocation(line: 99, column: 13, scope: !159)
!162 = !DILocation(line: 107, column: 9, scope: !77)
!163 = !DILocation(line: 109, column: 5, scope: !65)
!164 = !DILocalVariable(name: "buffer", scope: !165, file: !66, line: 112, type: !167)
!165 = distinct !DILexicalBlock(scope: !166, file: !66, line: 111, column: 9)
!166 = distinct !DILexicalBlock(scope: !65, file: !66, line: 110, column: 5)
!167 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !168)
!168 = !{!169}
!169 = !DISubrange(count: 10)
!170 = !DILocation(line: 112, column: 17, scope: !165)
!171 = !DILocation(line: 115, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !165, file: !66, line: 115, column: 17)
!173 = !DILocation(line: 115, column: 22, scope: !172)
!174 = !DILocation(line: 115, column: 17, scope: !165)
!175 = !DILocation(line: 117, column: 37, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !66, line: 116, column: 13)
!177 = !DILocation(line: 117, column: 30, scope: !176)
!178 = !DILocation(line: 117, column: 17, scope: !176)
!179 = !DILocation(line: 118, column: 13, scope: !176)
!180 = !DILocation(line: 121, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !172, file: !66, line: 120, column: 13)
!182 = !DILocation(line: 124, column: 9, scope: !166)
!183 = !DILocation(line: 126, column: 1, scope: !65)
!184 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_16_good", scope: !66, file: !66, line: 248, type: !67, scopeLine: 249, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!185 = !DILocation(line: 250, column: 5, scope: !184)
!186 = !DILocation(line: 251, column: 5, scope: !184)
!187 = !DILocation(line: 252, column: 1, scope: !184)
!188 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 263, type: !189, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!189 = !DISubroutineType(types: !190)
!190 = !{!71, !71, !191}
!191 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !192, size: 64)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!193 = !DILocalVariable(name: "argc", arg: 1, scope: !188, file: !66, line: 263, type: !71)
!194 = !DILocation(line: 263, column: 14, scope: !188)
!195 = !DILocalVariable(name: "argv", arg: 2, scope: !188, file: !66, line: 263, type: !191)
!196 = !DILocation(line: 263, column: 27, scope: !188)
!197 = !DILocation(line: 266, column: 22, scope: !188)
!198 = !DILocation(line: 266, column: 12, scope: !188)
!199 = !DILocation(line: 266, column: 5, scope: !188)
!200 = !DILocation(line: 268, column: 5, scope: !188)
!201 = !DILocation(line: 269, column: 5, scope: !188)
!202 = !DILocation(line: 270, column: 5, scope: !188)
!203 = !DILocation(line: 273, column: 5, scope: !188)
!204 = !DILocation(line: 274, column: 5, scope: !188)
!205 = !DILocation(line: 275, column: 5, scope: !188)
!206 = !DILocation(line: 277, column: 5, scope: !188)
!207 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 133, type: !67, scopeLine: 134, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!208 = !DILocalVariable(name: "data", scope: !207, file: !66, line: 135, type: !71)
!209 = !DILocation(line: 135, column: 9, scope: !207)
!210 = !DILocation(line: 137, column: 10, scope: !207)
!211 = !DILocation(line: 138, column: 5, scope: !207)
!212 = !DILocalVariable(name: "recvResult", scope: !213, file: !66, line: 145, type: !71)
!213 = distinct !DILexicalBlock(scope: !214, file: !66, line: 140, column: 9)
!214 = distinct !DILexicalBlock(scope: !207, file: !66, line: 139, column: 5)
!215 = !DILocation(line: 145, column: 17, scope: !213)
!216 = !DILocalVariable(name: "service", scope: !213, file: !66, line: 146, type: !80)
!217 = !DILocation(line: 146, column: 32, scope: !213)
!218 = !DILocalVariable(name: "connectSocket", scope: !213, file: !66, line: 147, type: !71)
!219 = !DILocation(line: 147, column: 20, scope: !213)
!220 = !DILocalVariable(name: "inputBuffer", scope: !213, file: !66, line: 148, type: !55)
!221 = !DILocation(line: 148, column: 18, scope: !213)
!222 = !DILocation(line: 149, column: 13, scope: !213)
!223 = !DILocation(line: 159, column: 33, scope: !224)
!224 = distinct !DILexicalBlock(scope: !213, file: !66, line: 150, column: 13)
!225 = !DILocation(line: 159, column: 31, scope: !224)
!226 = !DILocation(line: 160, column: 21, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !66, line: 160, column: 21)
!228 = !DILocation(line: 160, column: 35, scope: !227)
!229 = !DILocation(line: 160, column: 21, scope: !224)
!230 = !DILocation(line: 162, column: 21, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !66, line: 161, column: 17)
!232 = !DILocation(line: 164, column: 17, scope: !224)
!233 = !DILocation(line: 165, column: 25, scope: !224)
!234 = !DILocation(line: 165, column: 36, scope: !224)
!235 = !DILocation(line: 166, column: 43, scope: !224)
!236 = !DILocation(line: 166, column: 25, scope: !224)
!237 = !DILocation(line: 166, column: 34, scope: !224)
!238 = !DILocation(line: 166, column: 41, scope: !224)
!239 = !DILocation(line: 167, column: 36, scope: !224)
!240 = !DILocation(line: 167, column: 25, scope: !224)
!241 = !DILocation(line: 167, column: 34, scope: !224)
!242 = !DILocation(line: 168, column: 29, scope: !243)
!243 = distinct !DILexicalBlock(scope: !224, file: !66, line: 168, column: 21)
!244 = !DILocation(line: 168, column: 44, scope: !243)
!245 = !DILocation(line: 168, column: 21, scope: !243)
!246 = !DILocation(line: 168, column: 89, scope: !243)
!247 = !DILocation(line: 168, column: 21, scope: !224)
!248 = !DILocation(line: 170, column: 21, scope: !249)
!249 = distinct !DILexicalBlock(scope: !243, file: !66, line: 169, column: 17)
!250 = !DILocation(line: 174, column: 35, scope: !224)
!251 = !DILocation(line: 174, column: 50, scope: !224)
!252 = !DILocation(line: 174, column: 30, scope: !224)
!253 = !DILocation(line: 174, column: 28, scope: !224)
!254 = !DILocation(line: 175, column: 21, scope: !255)
!255 = distinct !DILexicalBlock(scope: !224, file: !66, line: 175, column: 21)
!256 = !DILocation(line: 175, column: 32, scope: !255)
!257 = !DILocation(line: 175, column: 48, scope: !255)
!258 = !DILocation(line: 175, column: 51, scope: !255)
!259 = !DILocation(line: 175, column: 62, scope: !255)
!260 = !DILocation(line: 175, column: 21, scope: !224)
!261 = !DILocation(line: 177, column: 21, scope: !262)
!262 = distinct !DILexicalBlock(scope: !255, file: !66, line: 176, column: 17)
!263 = !DILocation(line: 180, column: 29, scope: !224)
!264 = !DILocation(line: 180, column: 17, scope: !224)
!265 = !DILocation(line: 180, column: 41, scope: !224)
!266 = !DILocation(line: 182, column: 29, scope: !224)
!267 = !DILocation(line: 182, column: 24, scope: !224)
!268 = !DILocation(line: 182, column: 22, scope: !224)
!269 = !DILocation(line: 183, column: 13, scope: !224)
!270 = !DILocation(line: 185, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !213, file: !66, line: 185, column: 17)
!272 = !DILocation(line: 185, column: 31, scope: !271)
!273 = !DILocation(line: 185, column: 17, scope: !213)
!274 = !DILocation(line: 187, column: 30, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !66, line: 186, column: 13)
!276 = !DILocation(line: 187, column: 17, scope: !275)
!277 = !DILocation(line: 188, column: 13, scope: !275)
!278 = !DILocation(line: 196, column: 9, scope: !214)
!279 = !DILocation(line: 198, column: 5, scope: !207)
!280 = !DILocalVariable(name: "buffer", scope: !281, file: !66, line: 201, type: !167)
!281 = distinct !DILexicalBlock(scope: !282, file: !66, line: 200, column: 9)
!282 = distinct !DILexicalBlock(scope: !207, file: !66, line: 199, column: 5)
!283 = !DILocation(line: 201, column: 17, scope: !281)
!284 = !DILocation(line: 203, column: 17, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !66, line: 203, column: 17)
!286 = !DILocation(line: 203, column: 22, scope: !285)
!287 = !DILocation(line: 203, column: 27, scope: !285)
!288 = !DILocation(line: 203, column: 30, scope: !285)
!289 = !DILocation(line: 203, column: 35, scope: !285)
!290 = !DILocation(line: 203, column: 17, scope: !281)
!291 = !DILocation(line: 205, column: 37, scope: !292)
!292 = distinct !DILexicalBlock(scope: !285, file: !66, line: 204, column: 13)
!293 = !DILocation(line: 205, column: 30, scope: !292)
!294 = !DILocation(line: 205, column: 17, scope: !292)
!295 = !DILocation(line: 206, column: 13, scope: !292)
!296 = !DILocation(line: 209, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !285, file: !66, line: 208, column: 13)
!298 = !DILocation(line: 212, column: 9, scope: !282)
!299 = !DILocation(line: 214, column: 1, scope: !207)
!300 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 217, type: !67, scopeLine: 218, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!301 = !DILocalVariable(name: "data", scope: !300, file: !66, line: 219, type: !71)
!302 = !DILocation(line: 219, column: 9, scope: !300)
!303 = !DILocation(line: 221, column: 10, scope: !300)
!304 = !DILocation(line: 222, column: 5, scope: !300)
!305 = !DILocation(line: 226, column: 14, scope: !306)
!306 = distinct !DILexicalBlock(scope: !300, file: !66, line: 223, column: 5)
!307 = !DILocation(line: 227, column: 9, scope: !306)
!308 = !DILocation(line: 229, column: 5, scope: !300)
!309 = !DILocalVariable(name: "buffer", scope: !310, file: !66, line: 232, type: !167)
!310 = distinct !DILexicalBlock(scope: !311, file: !66, line: 231, column: 9)
!311 = distinct !DILexicalBlock(scope: !300, file: !66, line: 230, column: 5)
!312 = !DILocation(line: 232, column: 17, scope: !310)
!313 = !DILocation(line: 235, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !66, line: 235, column: 17)
!315 = !DILocation(line: 235, column: 22, scope: !314)
!316 = !DILocation(line: 235, column: 17, scope: !310)
!317 = !DILocation(line: 237, column: 37, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !66, line: 236, column: 13)
!319 = !DILocation(line: 237, column: 30, scope: !318)
!320 = !DILocation(line: 237, column: 17, scope: !318)
!321 = !DILocation(line: 238, column: 13, scope: !318)
!322 = !DILocation(line: 241, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !314, file: !66, line: 240, column: 13)
!324 = !DILocation(line: 244, column: 9, scope: !311)
!325 = !DILocation(line: 246, column: 1, scope: !300)
