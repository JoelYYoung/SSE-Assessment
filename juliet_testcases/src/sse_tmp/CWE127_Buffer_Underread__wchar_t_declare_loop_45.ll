; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__wchar_t_declare_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE127_Buffer_Underread__wchar_t_declare_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !35
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !36
  store i32* %add.ptr, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %0, i32** @CWE127_Buffer_Underread__wchar_t_declare_loop_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_45_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #4, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #4, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_45_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_45_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i32*, i32** @CWE127_Buffer_Underread__wchar_t_declare_loop_45_badData, align 8, !dbg !68
  store i32* %0, i32** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i64* %i, metadata !69, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !76
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !77
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !83
  %cmp = icmp ult i64 %1, 100, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !87
  %3 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !87
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !87
  %5 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !91
  store i32 %4, i32* %arrayidx2, align 4, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %6, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !99
  store i32 0, i32* %arrayidx3, align 4, !dbg !100
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !101
  call void @printWLine(i32* %arraydecay4), !dbg !102
  ret void, !dbg !103
}

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !109
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !110
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !113
  store i32* %arraydecay1, i32** %data, align 8, !dbg !114
  %0 = load i32*, i32** %data, align 8, !dbg !115
  store i32* %0, i32** @CWE127_Buffer_Underread__wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !116
  call void @goodG2BSink(), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = load i32*, i32** @CWE127_Buffer_Underread__wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !122
  store i32* %0, i32** %data, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !129
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !135
  %cmp = icmp ult i64 %1, 100, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !139
  %3 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !139
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !139
  %5 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !143
  store i32 %4, i32* %arrayidx2, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %6, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !150
  store i32 0, i32* %arrayidx3, align 4, !dbg !151
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  call void @printWLine(i32* %arraydecay4), !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !13, line: 74, baseType: !14)
!13 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_45_bad", scope: !10, file: !10, line: 45, type: !22, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !10, line: 47, type: !11)
!25 = !DILocation(line: 47, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !10, line: 48, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 48, column: 13, scope: !21)
!31 = !DILocation(line: 49, column: 13, scope: !21)
!32 = !DILocation(line: 49, column: 5, scope: !21)
!33 = !DILocation(line: 50, column: 5, scope: !21)
!34 = !DILocation(line: 50, column: 23, scope: !21)
!35 = !DILocation(line: 52, column: 12, scope: !21)
!36 = !DILocation(line: 52, column: 23, scope: !21)
!37 = !DILocation(line: 52, column: 10, scope: !21)
!38 = !DILocation(line: 53, column: 64, scope: !21)
!39 = !DILocation(line: 53, column: 62, scope: !21)
!40 = !DILocation(line: 54, column: 5, scope: !21)
!41 = !DILocation(line: 55, column: 1, scope: !21)
!42 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_45_good", scope: !10, file: !10, line: 93, type: !22, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 95, column: 5, scope: !42)
!44 = !DILocation(line: 96, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 107, type: !46, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!14, !14, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !10, line: 107, type: !14)
!52 = !DILocation(line: 107, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !10, line: 107, type: !48)
!54 = !DILocation(line: 107, column: 27, scope: !45)
!55 = !DILocation(line: 110, column: 22, scope: !45)
!56 = !DILocation(line: 110, column: 12, scope: !45)
!57 = !DILocation(line: 110, column: 5, scope: !45)
!58 = !DILocation(line: 112, column: 5, scope: !45)
!59 = !DILocation(line: 113, column: 5, scope: !45)
!60 = !DILocation(line: 114, column: 5, scope: !45)
!61 = !DILocation(line: 117, column: 5, scope: !45)
!62 = !DILocation(line: 118, column: 5, scope: !45)
!63 = !DILocation(line: 119, column: 5, scope: !45)
!64 = !DILocation(line: 121, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocalVariable(name: "data", scope: !65, file: !10, line: 28, type: !11)
!67 = !DILocation(line: 28, column: 15, scope: !65)
!68 = !DILocation(line: 28, column: 22, scope: !65)
!69 = !DILocalVariable(name: "i", scope: !70, file: !10, line: 30, type: !71)
!70 = distinct !DILexicalBlock(scope: !65, file: !10, line: 29, column: 5)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !13, line: 46, baseType: !72)
!72 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!73 = !DILocation(line: 30, column: 16, scope: !70)
!74 = !DILocalVariable(name: "dest", scope: !70, file: !10, line: 31, type: !27)
!75 = !DILocation(line: 31, column: 17, scope: !70)
!76 = !DILocation(line: 32, column: 17, scope: !70)
!77 = !DILocation(line: 32, column: 9, scope: !70)
!78 = !DILocation(line: 33, column: 9, scope: !70)
!79 = !DILocation(line: 33, column: 21, scope: !70)
!80 = !DILocation(line: 35, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !70, file: !10, line: 35, column: 9)
!82 = !DILocation(line: 35, column: 14, scope: !81)
!83 = !DILocation(line: 35, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !10, line: 35, column: 9)
!85 = !DILocation(line: 35, column: 23, scope: !84)
!86 = !DILocation(line: 35, column: 9, scope: !81)
!87 = !DILocation(line: 37, column: 23, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !10, line: 36, column: 9)
!89 = !DILocation(line: 37, column: 28, scope: !88)
!90 = !DILocation(line: 37, column: 18, scope: !88)
!91 = !DILocation(line: 37, column: 13, scope: !88)
!92 = !DILocation(line: 37, column: 21, scope: !88)
!93 = !DILocation(line: 38, column: 9, scope: !88)
!94 = !DILocation(line: 35, column: 31, scope: !84)
!95 = !DILocation(line: 35, column: 9, scope: !84)
!96 = distinct !{!96, !86, !97, !98}
!97 = !DILocation(line: 38, column: 9, scope: !81)
!98 = !{!"llvm.loop.mustprogress"}
!99 = !DILocation(line: 40, column: 9, scope: !70)
!100 = !DILocation(line: 40, column: 21, scope: !70)
!101 = !DILocation(line: 41, column: 20, scope: !70)
!102 = !DILocation(line: 41, column: 9, scope: !70)
!103 = !DILocation(line: 43, column: 1, scope: !65)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 81, type: !22, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !10, line: 83, type: !11)
!106 = !DILocation(line: 83, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !10, line: 84, type: !27)
!108 = !DILocation(line: 84, column: 13, scope: !104)
!109 = !DILocation(line: 85, column: 13, scope: !104)
!110 = !DILocation(line: 85, column: 5, scope: !104)
!111 = !DILocation(line: 86, column: 5, scope: !104)
!112 = !DILocation(line: 86, column: 23, scope: !104)
!113 = !DILocation(line: 88, column: 12, scope: !104)
!114 = !DILocation(line: 88, column: 10, scope: !104)
!115 = !DILocation(line: 89, column: 68, scope: !104)
!116 = !DILocation(line: 89, column: 66, scope: !104)
!117 = !DILocation(line: 90, column: 5, scope: !104)
!118 = !DILocation(line: 91, column: 1, scope: !104)
!119 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 62, type: !22, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DILocalVariable(name: "data", scope: !119, file: !10, line: 64, type: !11)
!121 = !DILocation(line: 64, column: 15, scope: !119)
!122 = !DILocation(line: 64, column: 22, scope: !119)
!123 = !DILocalVariable(name: "i", scope: !124, file: !10, line: 66, type: !71)
!124 = distinct !DILexicalBlock(scope: !119, file: !10, line: 65, column: 5)
!125 = !DILocation(line: 66, column: 16, scope: !124)
!126 = !DILocalVariable(name: "dest", scope: !124, file: !10, line: 67, type: !27)
!127 = !DILocation(line: 67, column: 17, scope: !124)
!128 = !DILocation(line: 68, column: 17, scope: !124)
!129 = !DILocation(line: 68, column: 9, scope: !124)
!130 = !DILocation(line: 69, column: 9, scope: !124)
!131 = !DILocation(line: 69, column: 21, scope: !124)
!132 = !DILocation(line: 71, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !124, file: !10, line: 71, column: 9)
!134 = !DILocation(line: 71, column: 14, scope: !133)
!135 = !DILocation(line: 71, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !10, line: 71, column: 9)
!137 = !DILocation(line: 71, column: 23, scope: !136)
!138 = !DILocation(line: 71, column: 9, scope: !133)
!139 = !DILocation(line: 73, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !10, line: 72, column: 9)
!141 = !DILocation(line: 73, column: 28, scope: !140)
!142 = !DILocation(line: 73, column: 18, scope: !140)
!143 = !DILocation(line: 73, column: 13, scope: !140)
!144 = !DILocation(line: 73, column: 21, scope: !140)
!145 = !DILocation(line: 74, column: 9, scope: !140)
!146 = !DILocation(line: 71, column: 31, scope: !136)
!147 = !DILocation(line: 71, column: 9, scope: !136)
!148 = distinct !{!148, !138, !149, !98}
!149 = !DILocation(line: 74, column: 9, scope: !133)
!150 = !DILocation(line: 76, column: 9, scope: !124)
!151 = !DILocation(line: 76, column: 21, scope: !124)
!152 = !DILocation(line: 77, column: 20, scope: !124)
!153 = !DILocation(line: 77, column: 9, scope: !124)
!154 = !DILocation(line: 79, column: 1, scope: !119)
