; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_32.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !38
  %1 = load i32*, i32** %0, align 8, !dbg !39
  store i32* %1, i32** %data1, align 8, !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !40
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay2, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data1, align 8, !dbg !42
  %2 = load i32*, i32** %data1, align 8, !dbg !43
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !44
  store i32* %2, i32** %3, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !46, metadata !DIExpression()), !dbg !48
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !49
  %5 = load i32*, i32** %4, align 8, !dbg !50
  store i32* %5, i32** %data3, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !56
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call5 = call i32* @wmemset(i32* %arraydecay4, i32 67, i64 199) #4, !dbg !58
  %arrayidx6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !59
  store i32 0, i32* %arrayidx6, align 4, !dbg !60
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !61
  %6 = load i32*, i32** %data3, align 8, !dbg !62
  %call8 = call i32* @wcscpy(i32* %arraydecay7, i32* %6) #4, !dbg !63
  %arraydecay9 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !64
  call void @printWLine(i32* %arraydecay9), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_32_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #4, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #4, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_32_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_32_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !93, metadata !DIExpression()), !dbg !94
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !95, metadata !DIExpression()), !dbg !96
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !99
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !100
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !103, metadata !DIExpression()), !dbg !105
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !106
  %1 = load i32*, i32** %0, align 8, !dbg !107
  store i32* %1, i32** %data1, align 8, !dbg !105
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay2, i32** %data1, align 8, !dbg !109
  %2 = load i32*, i32** %data1, align 8, !dbg !110
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !111
  store i32* %2, i32** %3, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !113, metadata !DIExpression()), !dbg !115
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !116
  %5 = load i32*, i32** %4, align 8, !dbg !117
  store i32* %5, i32** %data3, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !118, metadata !DIExpression()), !dbg !120
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !121
  %call5 = call i32* @wmemset(i32* %arraydecay4, i32 67, i64 199) #4, !dbg !122
  %arrayidx6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !123
  store i32 0, i32* %arrayidx6, align 4, !dbg !124
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !125
  %6 = load i32*, i32** %data3, align 8, !dbg !126
  %call8 = call i32* @wcscpy(i32* %arraydecay7, i32* %6) #4, !dbg !127
  %arraydecay9 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !128
  call void @printWLine(i32* %arraydecay9), !dbg !129
  ret void, !dbg !130
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !11)
!24 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 28, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 28, column: 13, scope: !11)
!31 = !DILocation(line: 29, column: 13, scope: !11)
!32 = !DILocation(line: 29, column: 5, scope: !11)
!33 = !DILocation(line: 30, column: 5, scope: !11)
!34 = !DILocation(line: 30, column: 23, scope: !11)
!35 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 32, type: !16)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!37 = !DILocation(line: 32, column: 19, scope: !36)
!38 = !DILocation(line: 32, column: 27, scope: !36)
!39 = !DILocation(line: 32, column: 26, scope: !36)
!40 = !DILocation(line: 34, column: 16, scope: !36)
!41 = !DILocation(line: 34, column: 27, scope: !36)
!42 = !DILocation(line: 34, column: 14, scope: !36)
!43 = !DILocation(line: 35, column: 21, scope: !36)
!44 = !DILocation(line: 35, column: 10, scope: !36)
!45 = !DILocation(line: 35, column: 19, scope: !36)
!46 = !DILocalVariable(name: "data", scope: !47, file: !12, line: 38, type: !16)
!47 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!48 = !DILocation(line: 38, column: 19, scope: !47)
!49 = !DILocation(line: 38, column: 27, scope: !47)
!50 = !DILocation(line: 38, column: 26, scope: !47)
!51 = !DILocalVariable(name: "dest", scope: !52, file: !12, line: 40, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !12, line: 39, column: 9)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 200)
!56 = !DILocation(line: 40, column: 21, scope: !52)
!57 = !DILocation(line: 41, column: 21, scope: !52)
!58 = !DILocation(line: 41, column: 13, scope: !52)
!59 = !DILocation(line: 42, column: 13, scope: !52)
!60 = !DILocation(line: 42, column: 27, scope: !52)
!61 = !DILocation(line: 44, column: 20, scope: !52)
!62 = !DILocation(line: 44, column: 26, scope: !52)
!63 = !DILocation(line: 44, column: 13, scope: !52)
!64 = !DILocation(line: 45, column: 24, scope: !52)
!65 = !DILocation(line: 45, column: 13, scope: !52)
!66 = !DILocation(line: 48, column: 1, scope: !11)
!67 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_32_good", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 84, column: 5, scope: !67)
!69 = !DILocation(line: 85, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !71, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!19, !19, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !12, line: 96, type: !19)
!77 = !DILocation(line: 96, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !12, line: 96, type: !73)
!79 = !DILocation(line: 96, column: 27, scope: !70)
!80 = !DILocation(line: 99, column: 22, scope: !70)
!81 = !DILocation(line: 99, column: 12, scope: !70)
!82 = !DILocation(line: 99, column: 5, scope: !70)
!83 = !DILocation(line: 101, column: 5, scope: !70)
!84 = !DILocation(line: 102, column: 5, scope: !70)
!85 = !DILocation(line: 103, column: 5, scope: !70)
!86 = !DILocation(line: 106, column: 5, scope: !70)
!87 = !DILocation(line: 107, column: 5, scope: !70)
!88 = !DILocation(line: 108, column: 5, scope: !70)
!89 = !DILocation(line: 110, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 57, type: !16)
!92 = !DILocation(line: 57, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataPtr1", scope: !90, file: !12, line: 58, type: !22)
!94 = !DILocation(line: 58, column: 16, scope: !90)
!95 = !DILocalVariable(name: "dataPtr2", scope: !90, file: !12, line: 59, type: !22)
!96 = !DILocation(line: 59, column: 16, scope: !90)
!97 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !12, line: 60, type: !27)
!98 = !DILocation(line: 60, column: 13, scope: !90)
!99 = !DILocation(line: 61, column: 13, scope: !90)
!100 = !DILocation(line: 61, column: 5, scope: !90)
!101 = !DILocation(line: 62, column: 5, scope: !90)
!102 = !DILocation(line: 62, column: 23, scope: !90)
!103 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 64, type: !16)
!104 = distinct !DILexicalBlock(scope: !90, file: !12, line: 63, column: 5)
!105 = !DILocation(line: 64, column: 19, scope: !104)
!106 = !DILocation(line: 64, column: 27, scope: !104)
!107 = !DILocation(line: 64, column: 26, scope: !104)
!108 = !DILocation(line: 66, column: 16, scope: !104)
!109 = !DILocation(line: 66, column: 14, scope: !104)
!110 = !DILocation(line: 67, column: 21, scope: !104)
!111 = !DILocation(line: 67, column: 10, scope: !104)
!112 = !DILocation(line: 67, column: 19, scope: !104)
!113 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 70, type: !16)
!114 = distinct !DILexicalBlock(scope: !90, file: !12, line: 69, column: 5)
!115 = !DILocation(line: 70, column: 19, scope: !114)
!116 = !DILocation(line: 70, column: 27, scope: !114)
!117 = !DILocation(line: 70, column: 26, scope: !114)
!118 = !DILocalVariable(name: "dest", scope: !119, file: !12, line: 72, type: !53)
!119 = distinct !DILexicalBlock(scope: !114, file: !12, line: 71, column: 9)
!120 = !DILocation(line: 72, column: 21, scope: !119)
!121 = !DILocation(line: 73, column: 21, scope: !119)
!122 = !DILocation(line: 73, column: 13, scope: !119)
!123 = !DILocation(line: 74, column: 13, scope: !119)
!124 = !DILocation(line: 74, column: 27, scope: !119)
!125 = !DILocation(line: 76, column: 20, scope: !119)
!126 = !DILocation(line: 76, column: 26, scope: !119)
!127 = !DILocation(line: 76, column: 13, scope: !119)
!128 = !DILocation(line: 77, column: 24, scope: !119)
!129 = !DILocation(line: 77, column: 13, scope: !119)
!130 = !DILocation(line: 80, column: 1, scope: !90)
