; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_15.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_15_bad() #0 !dbg !11 {
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
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !31
  store i32* %add.ptr, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !39
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !40
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !41
  store i32 0, i32* %arrayidx4, align 4, !dbg !42
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !43
  %0 = load i32*, i32** %data, align 8, !dbg !44
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %0) #4, !dbg !45
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !46
  call void @printWLine(i32* %arraydecay7), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_15_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #4, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #4, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_15_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_15_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !78
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !79
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !82
  store i32* %arraydecay1, i32** %data, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !84, metadata !DIExpression()), !dbg !86
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !87
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !88
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !89
  store i32 0, i32* %arrayidx4, align 4, !dbg !90
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !91
  %0 = load i32*, i32** %data, align 8, !dbg !92
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %0) #4, !dbg !93
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !94
  call void @printWLine(i32* %arraydecay7), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !102
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !103
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !106
  store i32* %arraydecay1, i32** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !111
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !112
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !113
  store i32 0, i32* %arrayidx4, align 4, !dbg !114
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !115
  %0 = load i32*, i32** %data, align 8, !dbg !116
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %0) #4, !dbg !117
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !118
  call void @printWLine(i32* %arraydecay7), !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!30 = !DILocation(line: 33, column: 16, scope: !11)
!31 = !DILocation(line: 33, column: 27, scope: !11)
!32 = !DILocation(line: 33, column: 14, scope: !11)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !12, line: 41, type: !35)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 200)
!38 = !DILocation(line: 41, column: 17, scope: !34)
!39 = !DILocation(line: 42, column: 17, scope: !34)
!40 = !DILocation(line: 42, column: 9, scope: !34)
!41 = !DILocation(line: 43, column: 9, scope: !34)
!42 = !DILocation(line: 43, column: 23, scope: !34)
!43 = !DILocation(line: 45, column: 16, scope: !34)
!44 = !DILocation(line: 45, column: 22, scope: !34)
!45 = !DILocation(line: 45, column: 9, scope: !34)
!46 = !DILocation(line: 46, column: 20, scope: !34)
!47 = !DILocation(line: 46, column: 9, scope: !34)
!48 = !DILocation(line: 48, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_15_good", scope: !12, file: !12, line: 110, type: !13, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 112, column: 5, scope: !49)
!51 = !DILocation(line: 113, column: 5, scope: !49)
!52 = !DILocation(line: 114, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 126, type: !54, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!19, !19, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 126, type: !19)
!60 = !DILocation(line: 126, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 126, type: !56)
!62 = !DILocation(line: 126, column: 27, scope: !53)
!63 = !DILocation(line: 129, column: 22, scope: !53)
!64 = !DILocation(line: 129, column: 12, scope: !53)
!65 = !DILocation(line: 129, column: 5, scope: !53)
!66 = !DILocation(line: 131, column: 5, scope: !53)
!67 = !DILocation(line: 132, column: 5, scope: !53)
!68 = !DILocation(line: 133, column: 5, scope: !53)
!69 = !DILocation(line: 136, column: 5, scope: !53)
!70 = !DILocation(line: 137, column: 5, scope: !53)
!71 = !DILocation(line: 138, column: 5, scope: !53)
!72 = !DILocation(line: 140, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 57, type: !16)
!75 = !DILocation(line: 57, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !12, line: 58, type: !22)
!77 = !DILocation(line: 58, column: 13, scope: !73)
!78 = !DILocation(line: 59, column: 13, scope: !73)
!79 = !DILocation(line: 59, column: 5, scope: !73)
!80 = !DILocation(line: 60, column: 5, scope: !73)
!81 = !DILocation(line: 60, column: 23, scope: !73)
!82 = !DILocation(line: 69, column: 16, scope: !73)
!83 = !DILocation(line: 69, column: 14, scope: !73)
!84 = !DILocalVariable(name: "dest", scope: !85, file: !12, line: 73, type: !35)
!85 = distinct !DILexicalBlock(scope: !73, file: !12, line: 72, column: 5)
!86 = !DILocation(line: 73, column: 17, scope: !85)
!87 = !DILocation(line: 74, column: 17, scope: !85)
!88 = !DILocation(line: 74, column: 9, scope: !85)
!89 = !DILocation(line: 75, column: 9, scope: !85)
!90 = !DILocation(line: 75, column: 23, scope: !85)
!91 = !DILocation(line: 77, column: 16, scope: !85)
!92 = !DILocation(line: 77, column: 22, scope: !85)
!93 = !DILocation(line: 77, column: 9, scope: !85)
!94 = !DILocation(line: 78, column: 20, scope: !85)
!95 = !DILocation(line: 78, column: 9, scope: !85)
!96 = !DILocation(line: 80, column: 1, scope: !73)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 85, type: !16)
!99 = !DILocation(line: 85, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !12, line: 86, type: !22)
!101 = !DILocation(line: 86, column: 13, scope: !97)
!102 = !DILocation(line: 87, column: 13, scope: !97)
!103 = !DILocation(line: 87, column: 5, scope: !97)
!104 = !DILocation(line: 88, column: 5, scope: !97)
!105 = !DILocation(line: 88, column: 23, scope: !97)
!106 = !DILocation(line: 93, column: 16, scope: !97)
!107 = !DILocation(line: 93, column: 14, scope: !97)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !12, line: 101, type: !35)
!109 = distinct !DILexicalBlock(scope: !97, file: !12, line: 100, column: 5)
!110 = !DILocation(line: 101, column: 17, scope: !109)
!111 = !DILocation(line: 102, column: 17, scope: !109)
!112 = !DILocation(line: 102, column: 9, scope: !109)
!113 = !DILocation(line: 103, column: 9, scope: !109)
!114 = !DILocation(line: 103, column: 23, scope: !109)
!115 = !DILocation(line: 105, column: 16, scope: !109)
!116 = !DILocation(line: 105, column: 22, scope: !109)
!117 = !DILocation(line: 105, column: 9, scope: !109)
!118 = !DILocation(line: 106, column: 20, scope: !109)
!119 = !DILocation(line: 106, column: 9, scope: !109)
!120 = !DILocation(line: 108, column: 1, scope: !97)
