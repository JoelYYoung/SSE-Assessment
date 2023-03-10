; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_16.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  br label %while.body, !dbg !30

while.body:                                       ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !33
  store i32* %add.ptr, i32** %data, align 8, !dbg !34
  br label %while.end, !dbg !35

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !43
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !44
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx4, align 4, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %while.end
  %0 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %0, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data, align 8, !dbg !54
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx5 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !54
  %3 = load i32, i32* %arrayidx5, align 4, !dbg !54
  %4 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !58
  store i32 %3, i32* %arrayidx6, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %5, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !66
  store i32 0, i32* %arrayidx7, align 4, !dbg !67
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !68
  call void @printWLine(i32* %arraydecay8), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_16_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #4, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #4, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_16_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_16_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !99
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !100
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  br label %while.body, !dbg !103

while.body:                                       ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !104
  store i32* %arraydecay1, i32** %data, align 8, !dbg !106
  br label %while.end, !dbg !107

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !114
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx4, align 4, !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %while.end
  %0 = load i64, i64* %i, align 8, !dbg !120
  %cmp = icmp ult i64 %0, 100, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data, align 8, !dbg !124
  %2 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx5 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !124
  %3 = load i32, i32* %arrayidx5, align 4, !dbg !124
  %4 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !128
  store i32 %3, i32* %arrayidx6, align 4, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !131
  %inc = add i64 %5, 1, !dbg !131
  store i64 %inc, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx7, align 4, !dbg !136
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !137
  call void @printWLine(i32* %arraydecay8), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_16_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 13, scope: !11)
!27 = !DILocation(line: 27, column: 5, scope: !11)
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 28, column: 23, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 32, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!33 = !DILocation(line: 32, column: 27, scope: !32)
!34 = !DILocation(line: 32, column: 14, scope: !32)
!35 = !DILocation(line: 33, column: 9, scope: !32)
!36 = !DILocalVariable(name: "i", scope: !37, file: !12, line: 36, type: !38)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !39)
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 36, column: 16, scope: !37)
!41 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 37, type: !22)
!42 = !DILocation(line: 37, column: 17, scope: !37)
!43 = !DILocation(line: 38, column: 17, scope: !37)
!44 = !DILocation(line: 38, column: 9, scope: !37)
!45 = !DILocation(line: 39, column: 9, scope: !37)
!46 = !DILocation(line: 39, column: 21, scope: !37)
!47 = !DILocation(line: 41, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !37, file: !12, line: 41, column: 9)
!49 = !DILocation(line: 41, column: 14, scope: !48)
!50 = !DILocation(line: 41, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 41, column: 9)
!52 = !DILocation(line: 41, column: 23, scope: !51)
!53 = !DILocation(line: 41, column: 9, scope: !48)
!54 = !DILocation(line: 43, column: 23, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 42, column: 9)
!56 = !DILocation(line: 43, column: 28, scope: !55)
!57 = !DILocation(line: 43, column: 18, scope: !55)
!58 = !DILocation(line: 43, column: 13, scope: !55)
!59 = !DILocation(line: 43, column: 21, scope: !55)
!60 = !DILocation(line: 44, column: 9, scope: !55)
!61 = !DILocation(line: 41, column: 31, scope: !51)
!62 = !DILocation(line: 41, column: 9, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 44, column: 9, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 46, column: 9, scope: !37)
!67 = !DILocation(line: 46, column: 21, scope: !37)
!68 = !DILocation(line: 47, column: 20, scope: !37)
!69 = !DILocation(line: 47, column: 9, scope: !37)
!70 = !DILocation(line: 49, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_16_good", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 86, column: 5, scope: !71)
!73 = !DILocation(line: 87, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !75, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!19, !19, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 99, type: !19)
!81 = !DILocation(line: 99, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 99, type: !77)
!83 = !DILocation(line: 99, column: 27, scope: !74)
!84 = !DILocation(line: 102, column: 22, scope: !74)
!85 = !DILocation(line: 102, column: 12, scope: !74)
!86 = !DILocation(line: 102, column: 5, scope: !74)
!87 = !DILocation(line: 104, column: 5, scope: !74)
!88 = !DILocation(line: 105, column: 5, scope: !74)
!89 = !DILocation(line: 106, column: 5, scope: !74)
!90 = !DILocation(line: 109, column: 5, scope: !74)
!91 = !DILocation(line: 110, column: 5, scope: !74)
!92 = !DILocation(line: 111, column: 5, scope: !74)
!93 = !DILocation(line: 113, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 58, type: !16)
!96 = !DILocation(line: 58, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !12, line: 59, type: !22)
!98 = !DILocation(line: 59, column: 13, scope: !94)
!99 = !DILocation(line: 60, column: 13, scope: !94)
!100 = !DILocation(line: 60, column: 5, scope: !94)
!101 = !DILocation(line: 61, column: 5, scope: !94)
!102 = !DILocation(line: 61, column: 23, scope: !94)
!103 = !DILocation(line: 62, column: 5, scope: !94)
!104 = !DILocation(line: 65, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !94, file: !12, line: 63, column: 5)
!106 = !DILocation(line: 65, column: 14, scope: !105)
!107 = !DILocation(line: 66, column: 9, scope: !105)
!108 = !DILocalVariable(name: "i", scope: !109, file: !12, line: 69, type: !38)
!109 = distinct !DILexicalBlock(scope: !94, file: !12, line: 68, column: 5)
!110 = !DILocation(line: 69, column: 16, scope: !109)
!111 = !DILocalVariable(name: "dest", scope: !109, file: !12, line: 70, type: !22)
!112 = !DILocation(line: 70, column: 17, scope: !109)
!113 = !DILocation(line: 71, column: 17, scope: !109)
!114 = !DILocation(line: 71, column: 9, scope: !109)
!115 = !DILocation(line: 72, column: 9, scope: !109)
!116 = !DILocation(line: 72, column: 21, scope: !109)
!117 = !DILocation(line: 74, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !109, file: !12, line: 74, column: 9)
!119 = !DILocation(line: 74, column: 14, scope: !118)
!120 = !DILocation(line: 74, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 74, column: 9)
!122 = !DILocation(line: 74, column: 23, scope: !121)
!123 = !DILocation(line: 74, column: 9, scope: !118)
!124 = !DILocation(line: 76, column: 23, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 75, column: 9)
!126 = !DILocation(line: 76, column: 28, scope: !125)
!127 = !DILocation(line: 76, column: 18, scope: !125)
!128 = !DILocation(line: 76, column: 13, scope: !125)
!129 = !DILocation(line: 76, column: 21, scope: !125)
!130 = !DILocation(line: 77, column: 9, scope: !125)
!131 = !DILocation(line: 74, column: 31, scope: !121)
!132 = !DILocation(line: 74, column: 9, scope: !121)
!133 = distinct !{!133, !123, !134, !65}
!134 = !DILocation(line: 77, column: 9, scope: !118)
!135 = !DILocation(line: 79, column: 9, scope: !109)
!136 = !DILocation(line: 79, column: 21, scope: !109)
!137 = !DILocation(line: 80, column: 20, scope: !109)
!138 = !DILocation(line: 80, column: 9, scope: !109)
!139 = !DILocation(line: 82, column: 1, scope: !94)
