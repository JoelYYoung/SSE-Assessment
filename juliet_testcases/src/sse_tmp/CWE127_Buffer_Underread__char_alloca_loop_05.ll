; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_loop_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %0, i8** %dataBuffer, align 8, !dbg !26
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !29
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %3 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %3, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !37
  store i8* %add.ptr, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx1, align 1, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !57
  %cmp = icmp ult i64 %5, 100, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !61
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !61
  %9 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !65
  store i8 %8, i8* %arrayidx3, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %10, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !73
  store i8 0, i8* %arrayidx4, align 1, !dbg !74
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !75
  call void @printLine(i8* %arraydecay5), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_loop_05_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #5, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #5, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE127_Buffer_Underread__char_alloca_loop_05_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE127_Buffer_Underread__char_alloca_loop_05_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 100, align 16, !dbg !105
  store i8* %0, i8** %dataBuffer, align 8, !dbg !104
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !107
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %3 = load i32, i32* @staticFalse, align 4, !dbg !110
  %tobool = icmp ne i32 %3, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  store i8* %4, i8** %data, align 8, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !124
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx1, align 1, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !130
  %cmp = icmp ult i64 %5, 100, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !134
  %7 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !134
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !134
  %9 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !138
  store i8 %8, i8* %arrayidx3, align 1, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %10, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !145
  store i8 0, i8* %arrayidx4, align 1, !dbg !146
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !147
  call void @printLine(i8* %arraydecay5), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  %0 = alloca i8, i64 100, align 16, !dbg !155
  store i8* %0, i8** %dataBuffer, align 8, !dbg !154
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !157
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !158
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !158
  store i8 0, i8* %arrayidx, align 1, !dbg !159
  %3 = load i32, i32* @staticTrue, align 4, !dbg !160
  %tobool = icmp ne i32 %3, 0, !dbg !160
  br i1 %tobool, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !163
  store i8* %4, i8** %data, align 8, !dbg !165
  br label %if.end, !dbg !166

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !167, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !170, metadata !DIExpression()), !dbg !171
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !172
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !173
  store i8 0, i8* %arrayidx1, align 1, !dbg !174
  store i64 0, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !178
  %cmp = icmp ult i64 %5, 100, !dbg !180
  br i1 %cmp, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !182
  %7 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !182
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !182
  %9 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !186
  store i8 %8, i8* %arrayidx3, align 1, !dbg !187
  br label %for.inc, !dbg !188

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !189
  %inc = add i64 %10, 1, !dbg !189
  store i64 %inc, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !190, !llvm.loop !191

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !193
  store i8 0, i8* %arrayidx4, align 1, !dbg !194
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !195
  call void @printLine(i8* %arraydecay5), !dbg !196
  ret void, !dbg !197
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_loop_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !12, line: 33, type: !6)
!26 = !DILocation(line: 33, column: 12, scope: !20)
!27 = !DILocation(line: 33, column: 33, scope: !20)
!28 = !DILocation(line: 34, column: 12, scope: !20)
!29 = !DILocation(line: 34, column: 5, scope: !20)
!30 = !DILocation(line: 35, column: 5, scope: !20)
!31 = !DILocation(line: 35, column: 23, scope: !20)
!32 = !DILocation(line: 36, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !20, file: !12, line: 36, column: 8)
!34 = !DILocation(line: 36, column: 8, scope: !20)
!35 = !DILocation(line: 39, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 37, column: 5)
!37 = !DILocation(line: 39, column: 27, scope: !36)
!38 = !DILocation(line: 39, column: 14, scope: !36)
!39 = !DILocation(line: 40, column: 5, scope: !36)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 42, type: !42)
!41 = distinct !DILexicalBlock(scope: !20, file: !12, line: 41, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 42, column: 16, scope: !41)
!46 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 43, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 43, column: 14, scope: !41)
!51 = !DILocation(line: 44, column: 9, scope: !41)
!52 = !DILocation(line: 45, column: 9, scope: !41)
!53 = !DILocation(line: 45, column: 21, scope: !41)
!54 = !DILocation(line: 47, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !41, file: !12, line: 47, column: 9)
!56 = !DILocation(line: 47, column: 14, scope: !55)
!57 = !DILocation(line: 47, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 47, column: 9)
!59 = !DILocation(line: 47, column: 23, scope: !58)
!60 = !DILocation(line: 47, column: 9, scope: !55)
!61 = !DILocation(line: 49, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !12, line: 48, column: 9)
!63 = !DILocation(line: 49, column: 28, scope: !62)
!64 = !DILocation(line: 49, column: 18, scope: !62)
!65 = !DILocation(line: 49, column: 13, scope: !62)
!66 = !DILocation(line: 49, column: 21, scope: !62)
!67 = !DILocation(line: 50, column: 9, scope: !62)
!68 = !DILocation(line: 47, column: 31, scope: !58)
!69 = !DILocation(line: 47, column: 9, scope: !58)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 50, column: 9, scope: !55)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 52, column: 9, scope: !41)
!74 = !DILocation(line: 52, column: 21, scope: !41)
!75 = !DILocation(line: 53, column: 19, scope: !41)
!76 = !DILocation(line: 53, column: 9, scope: !41)
!77 = !DILocation(line: 55, column: 1, scope: !20)
!78 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_loop_05_good", scope: !12, file: !12, line: 122, type: !21, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 124, column: 5, scope: !78)
!80 = !DILocation(line: 125, column: 5, scope: !78)
!81 = !DILocation(line: 126, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 138, type: !83, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!13, !13, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !12, line: 138, type: !13)
!87 = !DILocation(line: 138, column: 14, scope: !82)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !12, line: 138, type: !85)
!89 = !DILocation(line: 138, column: 27, scope: !82)
!90 = !DILocation(line: 141, column: 22, scope: !82)
!91 = !DILocation(line: 141, column: 12, scope: !82)
!92 = !DILocation(line: 141, column: 5, scope: !82)
!93 = !DILocation(line: 143, column: 5, scope: !82)
!94 = !DILocation(line: 144, column: 5, scope: !82)
!95 = !DILocation(line: 145, column: 5, scope: !82)
!96 = !DILocation(line: 148, column: 5, scope: !82)
!97 = !DILocation(line: 149, column: 5, scope: !82)
!98 = !DILocation(line: 150, column: 5, scope: !82)
!99 = !DILocation(line: 152, column: 5, scope: !82)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 62, type: !21, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 64, type: !6)
!102 = !DILocation(line: 64, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !12, line: 65, type: !6)
!104 = !DILocation(line: 65, column: 12, scope: !100)
!105 = !DILocation(line: 65, column: 33, scope: !100)
!106 = !DILocation(line: 66, column: 12, scope: !100)
!107 = !DILocation(line: 66, column: 5, scope: !100)
!108 = !DILocation(line: 67, column: 5, scope: !100)
!109 = !DILocation(line: 67, column: 23, scope: !100)
!110 = !DILocation(line: 68, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !100, file: !12, line: 68, column: 8)
!112 = !DILocation(line: 68, column: 8, scope: !100)
!113 = !DILocation(line: 71, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 69, column: 5)
!115 = !DILocation(line: 72, column: 5, scope: !114)
!116 = !DILocation(line: 76, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !12, line: 74, column: 5)
!118 = !DILocation(line: 76, column: 14, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !120, file: !12, line: 79, type: !42)
!120 = distinct !DILexicalBlock(scope: !100, file: !12, line: 78, column: 5)
!121 = !DILocation(line: 79, column: 16, scope: !120)
!122 = !DILocalVariable(name: "dest", scope: !120, file: !12, line: 80, type: !47)
!123 = !DILocation(line: 80, column: 14, scope: !120)
!124 = !DILocation(line: 81, column: 9, scope: !120)
!125 = !DILocation(line: 82, column: 9, scope: !120)
!126 = !DILocation(line: 82, column: 21, scope: !120)
!127 = !DILocation(line: 84, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !120, file: !12, line: 84, column: 9)
!129 = !DILocation(line: 84, column: 14, scope: !128)
!130 = !DILocation(line: 84, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 84, column: 9)
!132 = !DILocation(line: 84, column: 23, scope: !131)
!133 = !DILocation(line: 84, column: 9, scope: !128)
!134 = !DILocation(line: 86, column: 23, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !12, line: 85, column: 9)
!136 = !DILocation(line: 86, column: 28, scope: !135)
!137 = !DILocation(line: 86, column: 18, scope: !135)
!138 = !DILocation(line: 86, column: 13, scope: !135)
!139 = !DILocation(line: 86, column: 21, scope: !135)
!140 = !DILocation(line: 87, column: 9, scope: !135)
!141 = !DILocation(line: 84, column: 31, scope: !131)
!142 = !DILocation(line: 84, column: 9, scope: !131)
!143 = distinct !{!143, !133, !144, !72}
!144 = !DILocation(line: 87, column: 9, scope: !128)
!145 = !DILocation(line: 89, column: 9, scope: !120)
!146 = !DILocation(line: 89, column: 21, scope: !120)
!147 = !DILocation(line: 90, column: 19, scope: !120)
!148 = !DILocation(line: 90, column: 9, scope: !120)
!149 = !DILocation(line: 92, column: 1, scope: !100)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 95, type: !21, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "data", scope: !150, file: !12, line: 97, type: !6)
!152 = !DILocation(line: 97, column: 12, scope: !150)
!153 = !DILocalVariable(name: "dataBuffer", scope: !150, file: !12, line: 98, type: !6)
!154 = !DILocation(line: 98, column: 12, scope: !150)
!155 = !DILocation(line: 98, column: 33, scope: !150)
!156 = !DILocation(line: 99, column: 12, scope: !150)
!157 = !DILocation(line: 99, column: 5, scope: !150)
!158 = !DILocation(line: 100, column: 5, scope: !150)
!159 = !DILocation(line: 100, column: 23, scope: !150)
!160 = !DILocation(line: 101, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !150, file: !12, line: 101, column: 8)
!162 = !DILocation(line: 101, column: 8, scope: !150)
!163 = !DILocation(line: 104, column: 16, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !12, line: 102, column: 5)
!165 = !DILocation(line: 104, column: 14, scope: !164)
!166 = !DILocation(line: 105, column: 5, scope: !164)
!167 = !DILocalVariable(name: "i", scope: !168, file: !12, line: 107, type: !42)
!168 = distinct !DILexicalBlock(scope: !150, file: !12, line: 106, column: 5)
!169 = !DILocation(line: 107, column: 16, scope: !168)
!170 = !DILocalVariable(name: "dest", scope: !168, file: !12, line: 108, type: !47)
!171 = !DILocation(line: 108, column: 14, scope: !168)
!172 = !DILocation(line: 109, column: 9, scope: !168)
!173 = !DILocation(line: 110, column: 9, scope: !168)
!174 = !DILocation(line: 110, column: 21, scope: !168)
!175 = !DILocation(line: 112, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !168, file: !12, line: 112, column: 9)
!177 = !DILocation(line: 112, column: 14, scope: !176)
!178 = !DILocation(line: 112, column: 21, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !12, line: 112, column: 9)
!180 = !DILocation(line: 112, column: 23, scope: !179)
!181 = !DILocation(line: 112, column: 9, scope: !176)
!182 = !DILocation(line: 114, column: 23, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !12, line: 113, column: 9)
!184 = !DILocation(line: 114, column: 28, scope: !183)
!185 = !DILocation(line: 114, column: 18, scope: !183)
!186 = !DILocation(line: 114, column: 13, scope: !183)
!187 = !DILocation(line: 114, column: 21, scope: !183)
!188 = !DILocation(line: 115, column: 9, scope: !183)
!189 = !DILocation(line: 112, column: 31, scope: !179)
!190 = !DILocation(line: 112, column: 9, scope: !179)
!191 = distinct !{!191, !181, !192, !72}
!192 = !DILocation(line: 115, column: 9, scope: !176)
!193 = !DILocation(line: 117, column: 9, scope: !168)
!194 = !DILocation(line: 117, column: 21, scope: !168)
!195 = !DILocation(line: 118, column: 19, scope: !168)
!196 = !DILocation(line: 118, column: 9, scope: !168)
!197 = !DILocation(line: 120, column: 1, scope: !150)
