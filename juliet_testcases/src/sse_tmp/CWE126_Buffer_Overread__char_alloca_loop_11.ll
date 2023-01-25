; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_11.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_11_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !30
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !31
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx1, align 1, !dbg !32
  %call = call i32 (...) @globalReturnsTrue(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %6, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !53
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx2, align 1, !dbg !55
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !57
  store i64 %call4, i64* %destLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !62
  %8 = load i64, i64* %destLen, align 8, !dbg !64
  %cmp = icmp ult i64 %7, %8, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !67
  %10 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !67
  %11 = load i8, i8* %arrayidx5, align 1, !dbg !67
  %12 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !71
  store i8 %11, i8* %arrayidx6, align 1, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %13, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !79
  store i8 0, i8* %arrayidx7, align 1, !dbg !80
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !81
  call void @printLine(i8* %arraydecay8), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @globalReturnsTrue(...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_11_good() #0 !dbg !84 {
entry:
  call void @goodG2B1(), !dbg !85
  call void @goodG2B2(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE126_Buffer_Overread__char_alloca_loop_11_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE126_Buffer_Overread__char_alloca_loop_11_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 50, align 16, !dbg !112
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %1 = alloca i8, i64 100, align 16, !dbg !115
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !114
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !117
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !121
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !122
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !122
  store i8 0, i8* %arrayidx1, align 1, !dbg !123
  %call = call i32 (...) @globalReturnsFalse(), !dbg !124
  %tobool = icmp ne i32 %call, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.else, !dbg !126

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !127
  br label %if.end, !dbg !129

if.else:                                          ; preds = %entry
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !130
  store i8* %6, i8** %data, align 8, !dbg !132
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !140
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx2, align 1, !dbg !142
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !144
  store i64 %call4, i64* %destLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !149
  %8 = load i64, i64* %destLen, align 8, !dbg !151
  %cmp = icmp ult i64 %7, %8, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !154
  %10 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !154
  %11 = load i8, i8* %arrayidx5, align 1, !dbg !154
  %12 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !158
  store i8 %11, i8* %arrayidx6, align 1, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %13, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !165
  store i8 0, i8* %arrayidx7, align 1, !dbg !166
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !167
  call void @printLine(i8* %arraydecay8), !dbg !168
  ret void, !dbg !169
}

declare dso_local i32 @globalReturnsFalse(...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !170 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !173, metadata !DIExpression()), !dbg !174
  %0 = alloca i8, i64 50, align 16, !dbg !175
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !174
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !176, metadata !DIExpression()), !dbg !177
  %1 = alloca i8, i64 100, align 16, !dbg !178
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !177
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !179
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !180
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !181
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !181
  store i8 0, i8* %arrayidx, align 1, !dbg !182
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !183
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !184
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !185
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !185
  store i8 0, i8* %arrayidx1, align 1, !dbg !186
  %call = call i32 (...) @globalReturnsTrue(), !dbg !187
  %tobool = icmp ne i32 %call, 0, !dbg !187
  br i1 %tobool, label %if.then, label %if.end, !dbg !189

if.then:                                          ; preds = %entry
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !190
  store i8* %6, i8** %data, align 8, !dbg !192
  br label %if.end, !dbg !193

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !194, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !199, metadata !DIExpression()), !dbg !200
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !201
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !201
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !202
  store i8 0, i8* %arrayidx2, align 1, !dbg !203
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !204
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !205
  store i64 %call4, i64* %destLen, align 8, !dbg !206
  store i64 0, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !209

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !210
  %8 = load i64, i64* %destLen, align 8, !dbg !212
  %cmp = icmp ult i64 %7, %8, !dbg !213
  br i1 %cmp, label %for.body, label %for.end, !dbg !214

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !215
  %10 = load i64, i64* %i, align 8, !dbg !217
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !215
  %11 = load i8, i8* %arrayidx5, align 1, !dbg !215
  %12 = load i64, i64* %i, align 8, !dbg !218
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !219
  store i8 %11, i8* %arrayidx6, align 1, !dbg !220
  br label %for.inc, !dbg !221

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !222
  %inc = add i64 %13, 1, !dbg !222
  store i64 %inc, i64* %i, align 8, !dbg !222
  br label %for.cond, !dbg !223, !llvm.loop !224

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !226
  store i8 0, i8* %arrayidx7, align 1, !dbg !227
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !228
  call void @printLine(i8* %arraydecay8), !dbg !229
  ret void, !dbg !230
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_11_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 12, scope: !13)
!30 = !DILocation(line: 30, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 5, scope: !13)
!32 = !DILocation(line: 31, column: 27, scope: !13)
!33 = !DILocation(line: 32, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!35 = !DILocation(line: 32, column: 8, scope: !13)
!36 = !DILocation(line: 35, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !14, line: 33, column: 5)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 5, scope: !37)
!40 = !DILocalVariable(name: "i", scope: !41, file: !14, line: 38, type: !42)
!41 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 38, column: 16, scope: !41)
!46 = !DILocalVariable(name: "destLen", scope: !41, file: !14, line: 38, type: !42)
!47 = !DILocation(line: 38, column: 19, scope: !41)
!48 = !DILocalVariable(name: "dest", scope: !41, file: !14, line: 39, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 39, column: 14, scope: !41)
!53 = !DILocation(line: 40, column: 9, scope: !41)
!54 = !DILocation(line: 41, column: 9, scope: !41)
!55 = !DILocation(line: 41, column: 21, scope: !41)
!56 = !DILocation(line: 42, column: 26, scope: !41)
!57 = !DILocation(line: 42, column: 19, scope: !41)
!58 = !DILocation(line: 42, column: 17, scope: !41)
!59 = !DILocation(line: 45, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !41, file: !14, line: 45, column: 9)
!61 = !DILocation(line: 45, column: 14, scope: !60)
!62 = !DILocation(line: 45, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !14, line: 45, column: 9)
!64 = !DILocation(line: 45, column: 25, scope: !63)
!65 = !DILocation(line: 45, column: 23, scope: !63)
!66 = !DILocation(line: 45, column: 9, scope: !60)
!67 = !DILocation(line: 47, column: 23, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !14, line: 46, column: 9)
!69 = !DILocation(line: 47, column: 28, scope: !68)
!70 = !DILocation(line: 47, column: 18, scope: !68)
!71 = !DILocation(line: 47, column: 13, scope: !68)
!72 = !DILocation(line: 47, column: 21, scope: !68)
!73 = !DILocation(line: 48, column: 9, scope: !68)
!74 = !DILocation(line: 45, column: 35, scope: !63)
!75 = !DILocation(line: 45, column: 9, scope: !63)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 48, column: 9, scope: !60)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 49, column: 9, scope: !41)
!80 = !DILocation(line: 49, column: 21, scope: !41)
!81 = !DILocation(line: 50, column: 19, scope: !41)
!82 = !DILocation(line: 50, column: 9, scope: !41)
!83 = !DILocation(line: 52, column: 1, scope: !13)
!84 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_11_good", scope: !14, file: !14, line: 127, type: !15, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 129, column: 5, scope: !84)
!86 = !DILocation(line: 130, column: 5, scope: !84)
!87 = !DILocation(line: 131, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 143, type: !89, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !14, line: 143, type: !91)
!94 = !DILocation(line: 143, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !14, line: 143, type: !92)
!96 = !DILocation(line: 143, column: 27, scope: !88)
!97 = !DILocation(line: 146, column: 22, scope: !88)
!98 = !DILocation(line: 146, column: 12, scope: !88)
!99 = !DILocation(line: 146, column: 5, scope: !88)
!100 = !DILocation(line: 148, column: 5, scope: !88)
!101 = !DILocation(line: 149, column: 5, scope: !88)
!102 = !DILocation(line: 150, column: 5, scope: !88)
!103 = !DILocation(line: 153, column: 5, scope: !88)
!104 = !DILocation(line: 154, column: 5, scope: !88)
!105 = !DILocation(line: 155, column: 5, scope: !88)
!106 = !DILocation(line: 157, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !14, line: 61, type: !4)
!109 = !DILocation(line: 61, column: 12, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !14, line: 62, type: !4)
!111 = !DILocation(line: 62, column: 12, scope: !107)
!112 = !DILocation(line: 62, column: 36, scope: !107)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !14, line: 63, type: !4)
!114 = !DILocation(line: 63, column: 12, scope: !107)
!115 = !DILocation(line: 63, column: 37, scope: !107)
!116 = !DILocation(line: 64, column: 12, scope: !107)
!117 = !DILocation(line: 64, column: 5, scope: !107)
!118 = !DILocation(line: 65, column: 5, scope: !107)
!119 = !DILocation(line: 65, column: 25, scope: !107)
!120 = !DILocation(line: 66, column: 12, scope: !107)
!121 = !DILocation(line: 66, column: 5, scope: !107)
!122 = !DILocation(line: 67, column: 5, scope: !107)
!123 = !DILocation(line: 67, column: 27, scope: !107)
!124 = !DILocation(line: 68, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !107, file: !14, line: 68, column: 8)
!126 = !DILocation(line: 68, column: 8, scope: !107)
!127 = !DILocation(line: 71, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !14, line: 69, column: 5)
!129 = !DILocation(line: 72, column: 5, scope: !128)
!130 = !DILocation(line: 76, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !14, line: 74, column: 5)
!132 = !DILocation(line: 76, column: 14, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !134, file: !14, line: 79, type: !42)
!134 = distinct !DILexicalBlock(scope: !107, file: !14, line: 78, column: 5)
!135 = !DILocation(line: 79, column: 16, scope: !134)
!136 = !DILocalVariable(name: "destLen", scope: !134, file: !14, line: 79, type: !42)
!137 = !DILocation(line: 79, column: 19, scope: !134)
!138 = !DILocalVariable(name: "dest", scope: !134, file: !14, line: 80, type: !49)
!139 = !DILocation(line: 80, column: 14, scope: !134)
!140 = !DILocation(line: 81, column: 9, scope: !134)
!141 = !DILocation(line: 82, column: 9, scope: !134)
!142 = !DILocation(line: 82, column: 21, scope: !134)
!143 = !DILocation(line: 83, column: 26, scope: !134)
!144 = !DILocation(line: 83, column: 19, scope: !134)
!145 = !DILocation(line: 83, column: 17, scope: !134)
!146 = !DILocation(line: 86, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !134, file: !14, line: 86, column: 9)
!148 = !DILocation(line: 86, column: 14, scope: !147)
!149 = !DILocation(line: 86, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !14, line: 86, column: 9)
!151 = !DILocation(line: 86, column: 25, scope: !150)
!152 = !DILocation(line: 86, column: 23, scope: !150)
!153 = !DILocation(line: 86, column: 9, scope: !147)
!154 = !DILocation(line: 88, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !14, line: 87, column: 9)
!156 = !DILocation(line: 88, column: 28, scope: !155)
!157 = !DILocation(line: 88, column: 18, scope: !155)
!158 = !DILocation(line: 88, column: 13, scope: !155)
!159 = !DILocation(line: 88, column: 21, scope: !155)
!160 = !DILocation(line: 89, column: 9, scope: !155)
!161 = !DILocation(line: 86, column: 35, scope: !150)
!162 = !DILocation(line: 86, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164, !78}
!164 = !DILocation(line: 89, column: 9, scope: !147)
!165 = !DILocation(line: 90, column: 9, scope: !134)
!166 = !DILocation(line: 90, column: 21, scope: !134)
!167 = !DILocation(line: 91, column: 19, scope: !134)
!168 = !DILocation(line: 91, column: 9, scope: !134)
!169 = !DILocation(line: 93, column: 1, scope: !107)
!170 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 96, type: !15, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!171 = !DILocalVariable(name: "data", scope: !170, file: !14, line: 98, type: !4)
!172 = !DILocation(line: 98, column: 12, scope: !170)
!173 = !DILocalVariable(name: "dataBadBuffer", scope: !170, file: !14, line: 99, type: !4)
!174 = !DILocation(line: 99, column: 12, scope: !170)
!175 = !DILocation(line: 99, column: 36, scope: !170)
!176 = !DILocalVariable(name: "dataGoodBuffer", scope: !170, file: !14, line: 100, type: !4)
!177 = !DILocation(line: 100, column: 12, scope: !170)
!178 = !DILocation(line: 100, column: 37, scope: !170)
!179 = !DILocation(line: 101, column: 12, scope: !170)
!180 = !DILocation(line: 101, column: 5, scope: !170)
!181 = !DILocation(line: 102, column: 5, scope: !170)
!182 = !DILocation(line: 102, column: 25, scope: !170)
!183 = !DILocation(line: 103, column: 12, scope: !170)
!184 = !DILocation(line: 103, column: 5, scope: !170)
!185 = !DILocation(line: 104, column: 5, scope: !170)
!186 = !DILocation(line: 104, column: 27, scope: !170)
!187 = !DILocation(line: 105, column: 8, scope: !188)
!188 = distinct !DILexicalBlock(scope: !170, file: !14, line: 105, column: 8)
!189 = !DILocation(line: 105, column: 8, scope: !170)
!190 = !DILocation(line: 108, column: 16, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !14, line: 106, column: 5)
!192 = !DILocation(line: 108, column: 14, scope: !191)
!193 = !DILocation(line: 109, column: 5, scope: !191)
!194 = !DILocalVariable(name: "i", scope: !195, file: !14, line: 111, type: !42)
!195 = distinct !DILexicalBlock(scope: !170, file: !14, line: 110, column: 5)
!196 = !DILocation(line: 111, column: 16, scope: !195)
!197 = !DILocalVariable(name: "destLen", scope: !195, file: !14, line: 111, type: !42)
!198 = !DILocation(line: 111, column: 19, scope: !195)
!199 = !DILocalVariable(name: "dest", scope: !195, file: !14, line: 112, type: !49)
!200 = !DILocation(line: 112, column: 14, scope: !195)
!201 = !DILocation(line: 113, column: 9, scope: !195)
!202 = !DILocation(line: 114, column: 9, scope: !195)
!203 = !DILocation(line: 114, column: 21, scope: !195)
!204 = !DILocation(line: 115, column: 26, scope: !195)
!205 = !DILocation(line: 115, column: 19, scope: !195)
!206 = !DILocation(line: 115, column: 17, scope: !195)
!207 = !DILocation(line: 118, column: 16, scope: !208)
!208 = distinct !DILexicalBlock(scope: !195, file: !14, line: 118, column: 9)
!209 = !DILocation(line: 118, column: 14, scope: !208)
!210 = !DILocation(line: 118, column: 21, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !14, line: 118, column: 9)
!212 = !DILocation(line: 118, column: 25, scope: !211)
!213 = !DILocation(line: 118, column: 23, scope: !211)
!214 = !DILocation(line: 118, column: 9, scope: !208)
!215 = !DILocation(line: 120, column: 23, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !14, line: 119, column: 9)
!217 = !DILocation(line: 120, column: 28, scope: !216)
!218 = !DILocation(line: 120, column: 18, scope: !216)
!219 = !DILocation(line: 120, column: 13, scope: !216)
!220 = !DILocation(line: 120, column: 21, scope: !216)
!221 = !DILocation(line: 121, column: 9, scope: !216)
!222 = !DILocation(line: 118, column: 35, scope: !211)
!223 = !DILocation(line: 118, column: 9, scope: !211)
!224 = distinct !{!224, !214, !225, !78}
!225 = !DILocation(line: 121, column: 9, scope: !208)
!226 = !DILocation(line: 122, column: 9, scope: !195)
!227 = !DILocation(line: 122, column: 21, scope: !195)
!228 = !DILocation(line: 123, column: 19, scope: !195)
!229 = !DILocation(line: 123, column: 9, scope: !195)
!230 = !DILocation(line: 125, column: 1, scope: !170)
