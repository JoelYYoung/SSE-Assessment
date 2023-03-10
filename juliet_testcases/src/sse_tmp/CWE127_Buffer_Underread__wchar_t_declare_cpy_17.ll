; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_17.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !28
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !29
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !35
  %cmp = icmp slt i32 %0, 1, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !39
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data, align 8, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %1, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !56
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !57
  store i32 0, i32* %arrayidx4, align 4, !dbg !58
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !59
  %2 = load i32*, i32** %data, align 8, !dbg !60
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %2) #4, !dbg !61
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !62
  call void @printWLine(i32* %arraydecay7), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_17_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #4, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #4, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_17_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_17_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !95
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !96
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  store i32 0, i32* %h, align 4, !dbg !99
  br label %for.cond, !dbg !101

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !102
  %cmp = icmp slt i32 %0, 1, !dbg !104
  br i1 %cmp, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !106
  store i32* %arraydecay1, i32** %data, align 8, !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !110
  %inc = add nsw i32 %1, 1, !dbg !110
  store i32 %inc, i32* %h, align 4, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !117
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !118
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !119
  store i32 0, i32* %arrayidx4, align 4, !dbg !120
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !121
  %2 = load i32*, i32** %data, align 8, !dbg !122
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %2) #4, !dbg !123
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !124
  call void @printWLine(i32* %arraydecay7), !dbg !125
  ret void, !dbg !126
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 25, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !21, line: 74, baseType: !16)
!21 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!22 = !DILocation(line: 26, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 27, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 27, column: 13, scope: !11)
!28 = !DILocation(line: 28, column: 13, scope: !11)
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 23, scope: !11)
!32 = !DILocation(line: 30, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!34 = !DILocation(line: 30, column: 9, scope: !33)
!35 = !DILocation(line: 30, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 30, column: 5)
!37 = !DILocation(line: 30, column: 18, scope: !36)
!38 = !DILocation(line: 30, column: 5, scope: !33)
!39 = !DILocation(line: 33, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 31, column: 5)
!41 = !DILocation(line: 33, column: 27, scope: !40)
!42 = !DILocation(line: 33, column: 14, scope: !40)
!43 = !DILocation(line: 34, column: 5, scope: !40)
!44 = !DILocation(line: 30, column: 24, scope: !36)
!45 = !DILocation(line: 30, column: 5, scope: !36)
!46 = distinct !{!46, !38, !47, !48}
!47 = !DILocation(line: 34, column: 5, scope: !33)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocalVariable(name: "dest", scope: !50, file: !12, line: 36, type: !51)
!50 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 6400, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 200)
!54 = !DILocation(line: 36, column: 17, scope: !50)
!55 = !DILocation(line: 37, column: 17, scope: !50)
!56 = !DILocation(line: 37, column: 9, scope: !50)
!57 = !DILocation(line: 38, column: 9, scope: !50)
!58 = !DILocation(line: 38, column: 23, scope: !50)
!59 = !DILocation(line: 40, column: 16, scope: !50)
!60 = !DILocation(line: 40, column: 22, scope: !50)
!61 = !DILocation(line: 40, column: 9, scope: !50)
!62 = !DILocation(line: 41, column: 20, scope: !50)
!63 = !DILocation(line: 41, column: 9, scope: !50)
!64 = !DILocation(line: 43, column: 1, scope: !11)
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_17_good", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 74, column: 5, scope: !65)
!67 = !DILocation(line: 75, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 87, type: !69, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!16, !16, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 87, type: !16)
!75 = !DILocation(line: 87, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 87, type: !71)
!77 = !DILocation(line: 87, column: 27, scope: !68)
!78 = !DILocation(line: 90, column: 22, scope: !68)
!79 = !DILocation(line: 90, column: 12, scope: !68)
!80 = !DILocation(line: 90, column: 5, scope: !68)
!81 = !DILocation(line: 92, column: 5, scope: !68)
!82 = !DILocation(line: 93, column: 5, scope: !68)
!83 = !DILocation(line: 94, column: 5, scope: !68)
!84 = !DILocation(line: 97, column: 5, scope: !68)
!85 = !DILocation(line: 98, column: 5, scope: !68)
!86 = !DILocation(line: 99, column: 5, scope: !68)
!87 = !DILocation(line: 101, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "h", scope: !88, file: !12, line: 52, type: !16)
!90 = !DILocation(line: 52, column: 9, scope: !88)
!91 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 53, type: !19)
!92 = !DILocation(line: 53, column: 15, scope: !88)
!93 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !12, line: 54, type: !24)
!94 = !DILocation(line: 54, column: 13, scope: !88)
!95 = !DILocation(line: 55, column: 13, scope: !88)
!96 = !DILocation(line: 55, column: 5, scope: !88)
!97 = !DILocation(line: 56, column: 5, scope: !88)
!98 = !DILocation(line: 56, column: 23, scope: !88)
!99 = !DILocation(line: 57, column: 11, scope: !100)
!100 = distinct !DILexicalBlock(scope: !88, file: !12, line: 57, column: 5)
!101 = !DILocation(line: 57, column: 9, scope: !100)
!102 = !DILocation(line: 57, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !12, line: 57, column: 5)
!104 = !DILocation(line: 57, column: 18, scope: !103)
!105 = !DILocation(line: 57, column: 5, scope: !100)
!106 = !DILocation(line: 60, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !12, line: 58, column: 5)
!108 = !DILocation(line: 60, column: 14, scope: !107)
!109 = !DILocation(line: 61, column: 5, scope: !107)
!110 = !DILocation(line: 57, column: 24, scope: !103)
!111 = !DILocation(line: 57, column: 5, scope: !103)
!112 = distinct !{!112, !105, !113, !48}
!113 = !DILocation(line: 61, column: 5, scope: !100)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !12, line: 63, type: !51)
!115 = distinct !DILexicalBlock(scope: !88, file: !12, line: 62, column: 5)
!116 = !DILocation(line: 63, column: 17, scope: !115)
!117 = !DILocation(line: 64, column: 17, scope: !115)
!118 = !DILocation(line: 64, column: 9, scope: !115)
!119 = !DILocation(line: 65, column: 9, scope: !115)
!120 = !DILocation(line: 65, column: 23, scope: !115)
!121 = !DILocation(line: 67, column: 16, scope: !115)
!122 = !DILocation(line: 67, column: 22, scope: !115)
!123 = !DILocation(line: 67, column: 9, scope: !115)
!124 = !DILocation(line: 68, column: 20, scope: !115)
!125 = !DILocation(line: 68, column: 9, scope: !115)
!126 = !DILocation(line: 70, column: 1, scope: !88)
