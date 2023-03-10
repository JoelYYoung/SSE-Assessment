; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_41_badSink(i32* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i64* %i, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %0, 100, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data.addr, align 8, !dbg !42
  %2 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx1 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !42
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !42
  %4 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !46
  store i32 %3, i32* %arrayidx2, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %5, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx3, align 4, !dbg !55
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  call void @printWLine(i32* %arraydecay4), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_41_bad() #0 !dbg !59 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !64, metadata !DIExpression()), !dbg !65
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !66
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !67
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !68
  store i32 0, i32* %arrayidx, align 4, !dbg !69
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !70
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !71
  store i32* %add.ptr, i32** %data, align 8, !dbg !72
  %0 = load i32*, i32** %data, align 8, !dbg !73
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_41_badSink(i32* %0), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_41_goodG2BSink(i32* %data) #0 !dbg !76 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i64* %i, metadata !79, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !84
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !85
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  store i64 0, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !91
  %cmp = icmp ult i64 %0, 100, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data.addr, align 8, !dbg !95
  %2 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx1 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !95
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !95
  %4 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !99
  store i32 %3, i32* %arrayidx2, align 4, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !102
  %inc = add i64 %5, 1, !dbg !102
  store i64 %inc, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !106
  store i32 0, i32* %arrayidx3, align 4, !dbg !107
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !108
  call void @printWLine(i32* %arraydecay4), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_41_good() #0 !dbg !111 {
entry:
  call void @goodG2B(), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !114 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !120, metadata !DIExpression()), !dbg !121
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !122, metadata !DIExpression()), !dbg !123
  %call = call i64 @time(i64* null) #4, !dbg !124
  %conv = trunc i64 %call to i32, !dbg !125
  call void @srand(i32 %conv) #4, !dbg !126
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !127
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_41_good(), !dbg !128
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !129
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !130
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_41_bad(), !dbg !131
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !132
  ret i32 0, !dbg !133
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !134 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !139
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !140
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx, align 4, !dbg !142
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !143
  store i32* %arraydecay1, i32** %data, align 8, !dbg !144
  %0 = load i32*, i32** %data, align 8, !dbg !145
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_41_goodG2BSink(i32* %0), !dbg !146
  ret void, !dbg !147
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!20 = !DILocation(line: 23, column: 73, scope: !11)
!21 = !DILocalVariable(name: "i", scope: !22, file: !12, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !17, line: 46, baseType: !24)
!24 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DILocation(line: 26, column: 16, scope: !22)
!26 = !DILocalVariable(name: "dest", scope: !22, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 17, scope: !22)
!31 = !DILocation(line: 28, column: 17, scope: !22)
!32 = !DILocation(line: 28, column: 9, scope: !22)
!33 = !DILocation(line: 29, column: 9, scope: !22)
!34 = !DILocation(line: 29, column: 21, scope: !22)
!35 = !DILocation(line: 31, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !22, file: !12, line: 31, column: 9)
!37 = !DILocation(line: 31, column: 14, scope: !36)
!38 = !DILocation(line: 31, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 31, column: 9)
!40 = !DILocation(line: 31, column: 23, scope: !39)
!41 = !DILocation(line: 31, column: 9, scope: !36)
!42 = !DILocation(line: 33, column: 23, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !12, line: 32, column: 9)
!44 = !DILocation(line: 33, column: 28, scope: !43)
!45 = !DILocation(line: 33, column: 18, scope: !43)
!46 = !DILocation(line: 33, column: 13, scope: !43)
!47 = !DILocation(line: 33, column: 21, scope: !43)
!48 = !DILocation(line: 34, column: 9, scope: !43)
!49 = !DILocation(line: 31, column: 31, scope: !39)
!50 = !DILocation(line: 31, column: 9, scope: !39)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 34, column: 9, scope: !36)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 36, column: 9, scope: !22)
!55 = !DILocation(line: 36, column: 21, scope: !22)
!56 = !DILocation(line: 37, column: 20, scope: !22)
!57 = !DILocation(line: 37, column: 9, scope: !22)
!58 = !DILocation(line: 39, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_41_bad", scope: !12, file: !12, line: 41, type: !60, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{null}
!62 = !DILocalVariable(name: "data", scope: !59, file: !12, line: 43, type: !15)
!63 = !DILocation(line: 43, column: 15, scope: !59)
!64 = !DILocalVariable(name: "dataBuffer", scope: !59, file: !12, line: 44, type: !27)
!65 = !DILocation(line: 44, column: 13, scope: !59)
!66 = !DILocation(line: 45, column: 13, scope: !59)
!67 = !DILocation(line: 45, column: 5, scope: !59)
!68 = !DILocation(line: 46, column: 5, scope: !59)
!69 = !DILocation(line: 46, column: 23, scope: !59)
!70 = !DILocation(line: 48, column: 12, scope: !59)
!71 = !DILocation(line: 48, column: 23, scope: !59)
!72 = !DILocation(line: 48, column: 10, scope: !59)
!73 = !DILocation(line: 49, column: 62, scope: !59)
!74 = !DILocation(line: 49, column: 5, scope: !59)
!75 = !DILocation(line: 50, column: 1, scope: !59)
!76 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", arg: 1, scope: !76, file: !12, line: 56, type: !15)
!78 = !DILocation(line: 56, column: 77, scope: !76)
!79 = !DILocalVariable(name: "i", scope: !80, file: !12, line: 59, type: !23)
!80 = distinct !DILexicalBlock(scope: !76, file: !12, line: 58, column: 5)
!81 = !DILocation(line: 59, column: 16, scope: !80)
!82 = !DILocalVariable(name: "dest", scope: !80, file: !12, line: 60, type: !27)
!83 = !DILocation(line: 60, column: 17, scope: !80)
!84 = !DILocation(line: 61, column: 17, scope: !80)
!85 = !DILocation(line: 61, column: 9, scope: !80)
!86 = !DILocation(line: 62, column: 9, scope: !80)
!87 = !DILocation(line: 62, column: 21, scope: !80)
!88 = !DILocation(line: 64, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !80, file: !12, line: 64, column: 9)
!90 = !DILocation(line: 64, column: 14, scope: !89)
!91 = !DILocation(line: 64, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !12, line: 64, column: 9)
!93 = !DILocation(line: 64, column: 23, scope: !92)
!94 = !DILocation(line: 64, column: 9, scope: !89)
!95 = !DILocation(line: 66, column: 23, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !12, line: 65, column: 9)
!97 = !DILocation(line: 66, column: 28, scope: !96)
!98 = !DILocation(line: 66, column: 18, scope: !96)
!99 = !DILocation(line: 66, column: 13, scope: !96)
!100 = !DILocation(line: 66, column: 21, scope: !96)
!101 = !DILocation(line: 67, column: 9, scope: !96)
!102 = !DILocation(line: 64, column: 31, scope: !92)
!103 = !DILocation(line: 64, column: 9, scope: !92)
!104 = distinct !{!104, !94, !105, !53}
!105 = !DILocation(line: 67, column: 9, scope: !89)
!106 = !DILocation(line: 69, column: 9, scope: !80)
!107 = !DILocation(line: 69, column: 21, scope: !80)
!108 = !DILocation(line: 70, column: 20, scope: !80)
!109 = !DILocation(line: 70, column: 9, scope: !80)
!110 = !DILocation(line: 72, column: 1, scope: !76)
!111 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_41_good", scope: !12, file: !12, line: 86, type: !60, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocation(line: 88, column: 5, scope: !111)
!113 = !DILocation(line: 89, column: 1, scope: !111)
!114 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 101, type: !115, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DISubroutineType(types: !116)
!116 = !{!18, !18, !117}
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !118, size: 64)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!120 = !DILocalVariable(name: "argc", arg: 1, scope: !114, file: !12, line: 101, type: !18)
!121 = !DILocation(line: 101, column: 14, scope: !114)
!122 = !DILocalVariable(name: "argv", arg: 2, scope: !114, file: !12, line: 101, type: !117)
!123 = !DILocation(line: 101, column: 27, scope: !114)
!124 = !DILocation(line: 104, column: 22, scope: !114)
!125 = !DILocation(line: 104, column: 12, scope: !114)
!126 = !DILocation(line: 104, column: 5, scope: !114)
!127 = !DILocation(line: 106, column: 5, scope: !114)
!128 = !DILocation(line: 107, column: 5, scope: !114)
!129 = !DILocation(line: 108, column: 5, scope: !114)
!130 = !DILocation(line: 111, column: 5, scope: !114)
!131 = !DILocation(line: 112, column: 5, scope: !114)
!132 = !DILocation(line: 113, column: 5, scope: !114)
!133 = !DILocation(line: 115, column: 5, scope: !114)
!134 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 75, type: !60, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", scope: !134, file: !12, line: 77, type: !15)
!136 = !DILocation(line: 77, column: 15, scope: !134)
!137 = !DILocalVariable(name: "dataBuffer", scope: !134, file: !12, line: 78, type: !27)
!138 = !DILocation(line: 78, column: 13, scope: !134)
!139 = !DILocation(line: 79, column: 13, scope: !134)
!140 = !DILocation(line: 79, column: 5, scope: !134)
!141 = !DILocation(line: 80, column: 5, scope: !134)
!142 = !DILocation(line: 80, column: 23, scope: !134)
!143 = !DILocation(line: 82, column: 12, scope: !134)
!144 = !DILocation(line: 82, column: 10, scope: !134)
!145 = !DILocation(line: 83, column: 66, scope: !134)
!146 = !DILocation(line: 83, column: 5, scope: !134)
!147 = !DILocation(line: 84, column: 1, scope: !134)
