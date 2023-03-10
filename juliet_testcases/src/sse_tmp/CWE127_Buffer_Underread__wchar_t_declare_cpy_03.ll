; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_03.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_03_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !33
  store i32* %add.ptr, i32** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !41
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !42
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !43
  store i32 0, i32* %arrayidx4, align 4, !dbg !44
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !45
  %0 = load i32*, i32** %data, align 8, !dbg !46
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %0) #4, !dbg !47
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !48
  call void @printWLine(i32* %arraydecay7), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_03_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #4, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #4, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_03_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_03_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !80
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !81
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !84
  store i32* %arraydecay1, i32** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !91
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !92
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !93
  store i32 0, i32* %arrayidx4, align 4, !dbg !94
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !95
  %0 = load i32*, i32** %data, align 8, !dbg !96
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %0) #4, !dbg !97
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !98
  call void @printWLine(i32* %arraydecay7), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !107
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !110
  store i32* %arraydecay1, i32** %data, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !117
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !118
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !119
  store i32 0, i32* %arrayidx4, align 4, !dbg !120
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !121
  %0 = load i32*, i32** %data, align 8, !dbg !122
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %0) #4, !dbg !123
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_03.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_03_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_03.c", directory: "/home/joelyang/SSE-Assessment")
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
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 30, column: 5)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!33 = !DILocation(line: 32, column: 27, scope: !31)
!34 = !DILocation(line: 32, column: 14, scope: !31)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 200)
!40 = !DILocation(line: 35, column: 17, scope: !36)
!41 = !DILocation(line: 36, column: 17, scope: !36)
!42 = !DILocation(line: 36, column: 9, scope: !36)
!43 = !DILocation(line: 37, column: 9, scope: !36)
!44 = !DILocation(line: 37, column: 23, scope: !36)
!45 = !DILocation(line: 39, column: 16, scope: !36)
!46 = !DILocation(line: 39, column: 22, scope: !36)
!47 = !DILocation(line: 39, column: 9, scope: !36)
!48 = !DILocation(line: 40, column: 20, scope: !36)
!49 = !DILocation(line: 40, column: 9, scope: !36)
!50 = !DILocation(line: 42, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_03_good", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 99, column: 5, scope: !51)
!53 = !DILocation(line: 100, column: 5, scope: !51)
!54 = !DILocation(line: 101, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 113, type: !56, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!19, !19, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 113, type: !19)
!62 = !DILocation(line: 113, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 113, type: !58)
!64 = !DILocation(line: 113, column: 27, scope: !55)
!65 = !DILocation(line: 116, column: 22, scope: !55)
!66 = !DILocation(line: 116, column: 12, scope: !55)
!67 = !DILocation(line: 116, column: 5, scope: !55)
!68 = !DILocation(line: 118, column: 5, scope: !55)
!69 = !DILocation(line: 119, column: 5, scope: !55)
!70 = !DILocation(line: 120, column: 5, scope: !55)
!71 = !DILocation(line: 123, column: 5, scope: !55)
!72 = !DILocation(line: 124, column: 5, scope: !55)
!73 = !DILocation(line: 125, column: 5, scope: !55)
!74 = !DILocation(line: 127, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 51, type: !16)
!77 = !DILocation(line: 51, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !12, line: 52, type: !22)
!79 = !DILocation(line: 52, column: 13, scope: !75)
!80 = !DILocation(line: 53, column: 13, scope: !75)
!81 = !DILocation(line: 53, column: 5, scope: !75)
!82 = !DILocation(line: 54, column: 5, scope: !75)
!83 = !DILocation(line: 54, column: 23, scope: !75)
!84 = !DILocation(line: 63, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !12, line: 61, column: 5)
!86 = distinct !DILexicalBlock(scope: !75, file: !12, line: 55, column: 8)
!87 = !DILocation(line: 63, column: 14, scope: !85)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !12, line: 66, type: !37)
!89 = distinct !DILexicalBlock(scope: !75, file: !12, line: 65, column: 5)
!90 = !DILocation(line: 66, column: 17, scope: !89)
!91 = !DILocation(line: 67, column: 17, scope: !89)
!92 = !DILocation(line: 67, column: 9, scope: !89)
!93 = !DILocation(line: 68, column: 9, scope: !89)
!94 = !DILocation(line: 68, column: 23, scope: !89)
!95 = !DILocation(line: 70, column: 16, scope: !89)
!96 = !DILocation(line: 70, column: 22, scope: !89)
!97 = !DILocation(line: 70, column: 9, scope: !89)
!98 = !DILocation(line: 71, column: 20, scope: !89)
!99 = !DILocation(line: 71, column: 9, scope: !89)
!100 = !DILocation(line: 73, column: 1, scope: !75)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 78, type: !16)
!103 = !DILocation(line: 78, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !12, line: 79, type: !22)
!105 = !DILocation(line: 79, column: 13, scope: !101)
!106 = !DILocation(line: 80, column: 13, scope: !101)
!107 = !DILocation(line: 80, column: 5, scope: !101)
!108 = !DILocation(line: 81, column: 5, scope: !101)
!109 = !DILocation(line: 81, column: 23, scope: !101)
!110 = !DILocation(line: 85, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !112, file: !12, line: 83, column: 5)
!112 = distinct !DILexicalBlock(scope: !101, file: !12, line: 82, column: 8)
!113 = !DILocation(line: 85, column: 14, scope: !111)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !12, line: 88, type: !37)
!115 = distinct !DILexicalBlock(scope: !101, file: !12, line: 87, column: 5)
!116 = !DILocation(line: 88, column: 17, scope: !115)
!117 = !DILocation(line: 89, column: 17, scope: !115)
!118 = !DILocation(line: 89, column: 9, scope: !115)
!119 = !DILocation(line: 90, column: 9, scope: !115)
!120 = !DILocation(line: 90, column: 23, scope: !115)
!121 = !DILocation(line: 92, column: 16, scope: !115)
!122 = !DILocation(line: 92, column: 22, scope: !115)
!123 = !DILocation(line: 92, column: 9, scope: !115)
!124 = !DILocation(line: 93, column: 20, scope: !115)
!125 = !DILocation(line: 93, column: 9, scope: !115)
!126 = !DILocation(line: 95, column: 1, scope: !101)
