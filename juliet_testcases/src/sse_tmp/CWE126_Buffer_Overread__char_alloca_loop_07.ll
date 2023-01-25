; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 50, align 16, !dbg !25
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = alloca i8, i64 100, align 16, !dbg !28
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !27
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !30
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !34
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !35
  store i8 0, i8* %arrayidx1, align 1, !dbg !36
  %6 = load i32, i32* @staticFive, align 4, !dbg !37
  %cmp = icmp eq i32 %6, 5, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataBadBuffer, align 8, !dbg !41
  store i8* %7, i8** %data, align 8, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !53, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !58
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx2, align 1, !dbg !60
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !62
  store i64 %call, i64* %destLen, align 8, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !67
  %9 = load i64, i64* %destLen, align 8, !dbg !69
  %cmp4 = icmp ult i64 %8, %9, !dbg !70
  br i1 %cmp4, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !72
  %11 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !72
  %12 = load i8, i8* %arrayidx5, align 1, !dbg !72
  %13 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %13, !dbg !76
  store i8 %12, i8* %arrayidx6, align 1, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %14, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !84
  store i8 0, i8* %arrayidx7, align 1, !dbg !85
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !86
  call void @printLine(i8* %arraydecay8), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_07_good() #0 !dbg !89 {
entry:
  call void @goodG2B1(), !dbg !90
  call void @goodG2B2(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #7, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #7, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__char_alloca_loop_07_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__char_alloca_loop_07_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 50, align 16, !dbg !116
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %1 = alloca i8, i64 100, align 16, !dbg !119
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !118
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !121
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !125
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !126
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !126
  store i8 0, i8* %arrayidx1, align 1, !dbg !127
  %6 = load i32, i32* @staticFive, align 4, !dbg !128
  %cmp = icmp ne i32 %6, 5, !dbg !130
  br i1 %cmp, label %if.then, label %if.else, !dbg !131

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !132
  br label %if.end, !dbg !134

if.else:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !135
  store i8* %7, i8** %data, align 8, !dbg !137
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !143, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !145
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !146
  store i8 0, i8* %arrayidx2, align 1, !dbg !147
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !148
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !149
  store i64 %call, i64* %destLen, align 8, !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !154
  %9 = load i64, i64* %destLen, align 8, !dbg !156
  %cmp4 = icmp ult i64 %8, %9, !dbg !157
  br i1 %cmp4, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !159
  %11 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !159
  %12 = load i8, i8* %arrayidx5, align 1, !dbg !159
  %13 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %13, !dbg !163
  store i8 %12, i8* %arrayidx6, align 1, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %14, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !170
  store i8 0, i8* %arrayidx7, align 1, !dbg !171
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !172
  call void @printLine(i8* %arraydecay8), !dbg !173
  ret void, !dbg !174
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !175 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !178, metadata !DIExpression()), !dbg !179
  %0 = alloca i8, i64 50, align 16, !dbg !180
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !179
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !181, metadata !DIExpression()), !dbg !182
  %1 = alloca i8, i64 100, align 16, !dbg !183
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !182
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !184
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !185
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !186
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !186
  store i8 0, i8* %arrayidx, align 1, !dbg !187
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !188
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !189
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !190
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !190
  store i8 0, i8* %arrayidx1, align 1, !dbg !191
  %6 = load i32, i32* @staticFive, align 4, !dbg !192
  %cmp = icmp eq i32 %6, 5, !dbg !194
  br i1 %cmp, label %if.then, label %if.end, !dbg !195

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !196
  store i8* %7, i8** %data, align 8, !dbg !198
  br label %if.end, !dbg !199

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !203, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !205, metadata !DIExpression()), !dbg !206
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !207
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !207
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !208
  store i8 0, i8* %arrayidx2, align 1, !dbg !209
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !210
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !211
  store i64 %call, i64* %destLen, align 8, !dbg !212
  store i64 0, i64* %i, align 8, !dbg !213
  br label %for.cond, !dbg !215

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !216
  %9 = load i64, i64* %destLen, align 8, !dbg !218
  %cmp4 = icmp ult i64 %8, %9, !dbg !219
  br i1 %cmp4, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !221
  %11 = load i64, i64* %i, align 8, !dbg !223
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !221
  %12 = load i8, i8* %arrayidx5, align 1, !dbg !221
  %13 = load i64, i64* %i, align 8, !dbg !224
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %13, !dbg !225
  store i8 %12, i8* %arrayidx6, align 1, !dbg !226
  br label %for.inc, !dbg !227

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !228
  %inc = add i64 %14, 1, !dbg !228
  store i64 %inc, i64* %i, align 8, !dbg !228
  br label %for.cond, !dbg !229, !llvm.loop !230

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !232
  store i8 0, i8* %arrayidx7, align 1, !dbg !233
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !234
  call void @printLine(i8* %arraydecay8), !dbg !235
  ret void, !dbg !236
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_07_bad", scope: !10, file: !10, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 31, type: !6)
!22 = !DILocation(line: 31, column: 12, scope: !18)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocation(line: 32, column: 36, scope: !18)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 12, scope: !18)
!28 = !DILocation(line: 33, column: 37, scope: !18)
!29 = !DILocation(line: 34, column: 12, scope: !18)
!30 = !DILocation(line: 34, column: 5, scope: !18)
!31 = !DILocation(line: 35, column: 5, scope: !18)
!32 = !DILocation(line: 35, column: 25, scope: !18)
!33 = !DILocation(line: 36, column: 12, scope: !18)
!34 = !DILocation(line: 36, column: 5, scope: !18)
!35 = !DILocation(line: 37, column: 5, scope: !18)
!36 = !DILocation(line: 37, column: 27, scope: !18)
!37 = !DILocation(line: 38, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !18, file: !10, line: 38, column: 8)
!39 = !DILocation(line: 38, column: 18, scope: !38)
!40 = !DILocation(line: 38, column: 8, scope: !18)
!41 = !DILocation(line: 41, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !10, line: 39, column: 5)
!43 = !DILocation(line: 41, column: 14, scope: !42)
!44 = !DILocation(line: 42, column: 5, scope: !42)
!45 = !DILocalVariable(name: "i", scope: !46, file: !10, line: 44, type: !47)
!46 = distinct !DILexicalBlock(scope: !18, file: !10, line: 43, column: 5)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 44, column: 16, scope: !46)
!51 = !DILocalVariable(name: "destLen", scope: !46, file: !10, line: 44, type: !47)
!52 = !DILocation(line: 44, column: 19, scope: !46)
!53 = !DILocalVariable(name: "dest", scope: !46, file: !10, line: 45, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 45, column: 14, scope: !46)
!58 = !DILocation(line: 46, column: 9, scope: !46)
!59 = !DILocation(line: 47, column: 9, scope: !46)
!60 = !DILocation(line: 47, column: 21, scope: !46)
!61 = !DILocation(line: 48, column: 26, scope: !46)
!62 = !DILocation(line: 48, column: 19, scope: !46)
!63 = !DILocation(line: 48, column: 17, scope: !46)
!64 = !DILocation(line: 51, column: 16, scope: !65)
!65 = distinct !DILexicalBlock(scope: !46, file: !10, line: 51, column: 9)
!66 = !DILocation(line: 51, column: 14, scope: !65)
!67 = !DILocation(line: 51, column: 21, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !10, line: 51, column: 9)
!69 = !DILocation(line: 51, column: 25, scope: !68)
!70 = !DILocation(line: 51, column: 23, scope: !68)
!71 = !DILocation(line: 51, column: 9, scope: !65)
!72 = !DILocation(line: 53, column: 23, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !10, line: 52, column: 9)
!74 = !DILocation(line: 53, column: 28, scope: !73)
!75 = !DILocation(line: 53, column: 18, scope: !73)
!76 = !DILocation(line: 53, column: 13, scope: !73)
!77 = !DILocation(line: 53, column: 21, scope: !73)
!78 = !DILocation(line: 54, column: 9, scope: !73)
!79 = !DILocation(line: 51, column: 35, scope: !68)
!80 = !DILocation(line: 51, column: 9, scope: !68)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 54, column: 9, scope: !65)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 55, column: 9, scope: !46)
!85 = !DILocation(line: 55, column: 21, scope: !46)
!86 = !DILocation(line: 56, column: 19, scope: !46)
!87 = !DILocation(line: 56, column: 9, scope: !46)
!88 = !DILocation(line: 58, column: 1, scope: !18)
!89 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_07_good", scope: !10, file: !10, line: 133, type: !19, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocation(line: 135, column: 5, scope: !89)
!91 = !DILocation(line: 136, column: 5, scope: !89)
!92 = !DILocation(line: 137, column: 1, scope: !89)
!93 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 149, type: !94, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DISubroutineType(types: !95)
!95 = !{!11, !11, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !10, line: 149, type: !11)
!98 = !DILocation(line: 149, column: 14, scope: !93)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !10, line: 149, type: !96)
!100 = !DILocation(line: 149, column: 27, scope: !93)
!101 = !DILocation(line: 152, column: 22, scope: !93)
!102 = !DILocation(line: 152, column: 12, scope: !93)
!103 = !DILocation(line: 152, column: 5, scope: !93)
!104 = !DILocation(line: 154, column: 5, scope: !93)
!105 = !DILocation(line: 155, column: 5, scope: !93)
!106 = !DILocation(line: 156, column: 5, scope: !93)
!107 = !DILocation(line: 159, column: 5, scope: !93)
!108 = !DILocation(line: 160, column: 5, scope: !93)
!109 = !DILocation(line: 161, column: 5, scope: !93)
!110 = !DILocation(line: 163, column: 5, scope: !93)
!111 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 65, type: !19, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !10, line: 67, type: !6)
!113 = !DILocation(line: 67, column: 12, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !10, line: 68, type: !6)
!115 = !DILocation(line: 68, column: 12, scope: !111)
!116 = !DILocation(line: 68, column: 36, scope: !111)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !10, line: 69, type: !6)
!118 = !DILocation(line: 69, column: 12, scope: !111)
!119 = !DILocation(line: 69, column: 37, scope: !111)
!120 = !DILocation(line: 70, column: 12, scope: !111)
!121 = !DILocation(line: 70, column: 5, scope: !111)
!122 = !DILocation(line: 71, column: 5, scope: !111)
!123 = !DILocation(line: 71, column: 25, scope: !111)
!124 = !DILocation(line: 72, column: 12, scope: !111)
!125 = !DILocation(line: 72, column: 5, scope: !111)
!126 = !DILocation(line: 73, column: 5, scope: !111)
!127 = !DILocation(line: 73, column: 27, scope: !111)
!128 = !DILocation(line: 74, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !111, file: !10, line: 74, column: 8)
!130 = !DILocation(line: 74, column: 18, scope: !129)
!131 = !DILocation(line: 74, column: 8, scope: !111)
!132 = !DILocation(line: 77, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !10, line: 75, column: 5)
!134 = !DILocation(line: 78, column: 5, scope: !133)
!135 = !DILocation(line: 82, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !129, file: !10, line: 80, column: 5)
!137 = !DILocation(line: 82, column: 14, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !139, file: !10, line: 85, type: !47)
!139 = distinct !DILexicalBlock(scope: !111, file: !10, line: 84, column: 5)
!140 = !DILocation(line: 85, column: 16, scope: !139)
!141 = !DILocalVariable(name: "destLen", scope: !139, file: !10, line: 85, type: !47)
!142 = !DILocation(line: 85, column: 19, scope: !139)
!143 = !DILocalVariable(name: "dest", scope: !139, file: !10, line: 86, type: !54)
!144 = !DILocation(line: 86, column: 14, scope: !139)
!145 = !DILocation(line: 87, column: 9, scope: !139)
!146 = !DILocation(line: 88, column: 9, scope: !139)
!147 = !DILocation(line: 88, column: 21, scope: !139)
!148 = !DILocation(line: 89, column: 26, scope: !139)
!149 = !DILocation(line: 89, column: 19, scope: !139)
!150 = !DILocation(line: 89, column: 17, scope: !139)
!151 = !DILocation(line: 92, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !139, file: !10, line: 92, column: 9)
!153 = !DILocation(line: 92, column: 14, scope: !152)
!154 = !DILocation(line: 92, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !10, line: 92, column: 9)
!156 = !DILocation(line: 92, column: 25, scope: !155)
!157 = !DILocation(line: 92, column: 23, scope: !155)
!158 = !DILocation(line: 92, column: 9, scope: !152)
!159 = !DILocation(line: 94, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !10, line: 93, column: 9)
!161 = !DILocation(line: 94, column: 28, scope: !160)
!162 = !DILocation(line: 94, column: 18, scope: !160)
!163 = !DILocation(line: 94, column: 13, scope: !160)
!164 = !DILocation(line: 94, column: 21, scope: !160)
!165 = !DILocation(line: 95, column: 9, scope: !160)
!166 = !DILocation(line: 92, column: 35, scope: !155)
!167 = !DILocation(line: 92, column: 9, scope: !155)
!168 = distinct !{!168, !158, !169, !83}
!169 = !DILocation(line: 95, column: 9, scope: !152)
!170 = !DILocation(line: 96, column: 9, scope: !139)
!171 = !DILocation(line: 96, column: 21, scope: !139)
!172 = !DILocation(line: 97, column: 19, scope: !139)
!173 = !DILocation(line: 97, column: 9, scope: !139)
!174 = !DILocation(line: 99, column: 1, scope: !111)
!175 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 102, type: !19, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!176 = !DILocalVariable(name: "data", scope: !175, file: !10, line: 104, type: !6)
!177 = !DILocation(line: 104, column: 12, scope: !175)
!178 = !DILocalVariable(name: "dataBadBuffer", scope: !175, file: !10, line: 105, type: !6)
!179 = !DILocation(line: 105, column: 12, scope: !175)
!180 = !DILocation(line: 105, column: 36, scope: !175)
!181 = !DILocalVariable(name: "dataGoodBuffer", scope: !175, file: !10, line: 106, type: !6)
!182 = !DILocation(line: 106, column: 12, scope: !175)
!183 = !DILocation(line: 106, column: 37, scope: !175)
!184 = !DILocation(line: 107, column: 12, scope: !175)
!185 = !DILocation(line: 107, column: 5, scope: !175)
!186 = !DILocation(line: 108, column: 5, scope: !175)
!187 = !DILocation(line: 108, column: 25, scope: !175)
!188 = !DILocation(line: 109, column: 12, scope: !175)
!189 = !DILocation(line: 109, column: 5, scope: !175)
!190 = !DILocation(line: 110, column: 5, scope: !175)
!191 = !DILocation(line: 110, column: 27, scope: !175)
!192 = !DILocation(line: 111, column: 8, scope: !193)
!193 = distinct !DILexicalBlock(scope: !175, file: !10, line: 111, column: 8)
!194 = !DILocation(line: 111, column: 18, scope: !193)
!195 = !DILocation(line: 111, column: 8, scope: !175)
!196 = !DILocation(line: 114, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !10, line: 112, column: 5)
!198 = !DILocation(line: 114, column: 14, scope: !197)
!199 = !DILocation(line: 115, column: 5, scope: !197)
!200 = !DILocalVariable(name: "i", scope: !201, file: !10, line: 117, type: !47)
!201 = distinct !DILexicalBlock(scope: !175, file: !10, line: 116, column: 5)
!202 = !DILocation(line: 117, column: 16, scope: !201)
!203 = !DILocalVariable(name: "destLen", scope: !201, file: !10, line: 117, type: !47)
!204 = !DILocation(line: 117, column: 19, scope: !201)
!205 = !DILocalVariable(name: "dest", scope: !201, file: !10, line: 118, type: !54)
!206 = !DILocation(line: 118, column: 14, scope: !201)
!207 = !DILocation(line: 119, column: 9, scope: !201)
!208 = !DILocation(line: 120, column: 9, scope: !201)
!209 = !DILocation(line: 120, column: 21, scope: !201)
!210 = !DILocation(line: 121, column: 26, scope: !201)
!211 = !DILocation(line: 121, column: 19, scope: !201)
!212 = !DILocation(line: 121, column: 17, scope: !201)
!213 = !DILocation(line: 124, column: 16, scope: !214)
!214 = distinct !DILexicalBlock(scope: !201, file: !10, line: 124, column: 9)
!215 = !DILocation(line: 124, column: 14, scope: !214)
!216 = !DILocation(line: 124, column: 21, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !10, line: 124, column: 9)
!218 = !DILocation(line: 124, column: 25, scope: !217)
!219 = !DILocation(line: 124, column: 23, scope: !217)
!220 = !DILocation(line: 124, column: 9, scope: !214)
!221 = !DILocation(line: 126, column: 23, scope: !222)
!222 = distinct !DILexicalBlock(scope: !217, file: !10, line: 125, column: 9)
!223 = !DILocation(line: 126, column: 28, scope: !222)
!224 = !DILocation(line: 126, column: 18, scope: !222)
!225 = !DILocation(line: 126, column: 13, scope: !222)
!226 = !DILocation(line: 126, column: 21, scope: !222)
!227 = !DILocation(line: 127, column: 9, scope: !222)
!228 = !DILocation(line: 124, column: 35, scope: !217)
!229 = !DILocation(line: 124, column: 9, scope: !217)
!230 = distinct !{!230, !220, !231, !83}
!231 = !DILocation(line: 127, column: 9, scope: !214)
!232 = !DILocation(line: 128, column: 9, scope: !201)
!233 = !DILocation(line: 128, column: 21, scope: !201)
!234 = !DILocation(line: 129, column: 19, scope: !201)
!235 = !DILocation(line: 129, column: 9, scope: !201)
!236 = !DILocation(line: 131, column: 1, scope: !175)
