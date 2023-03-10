; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_memmove_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !31
  store i32* %add.ptr, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !35
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !37
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !38
  store i32 0, i32* %arrayidx4, align 4, !dbg !39
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !40
  %0 = bitcast i32* %arraydecay5 to i8*, !dbg !40
  %1 = load i32*, i32** %data, align 8, !dbg !41
  %2 = bitcast i32* %1 to i8*, !dbg !40
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 400, i1 false), !dbg !40
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx6, align 4, !dbg !43
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  call void @printWLine(i32* %arraydecay7), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_memmove_15_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #5, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #5, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE127_Buffer_Underread__wchar_t_declare_memmove_15_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE127_Buffer_Underread__wchar_t_declare_memmove_15_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !76
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !77
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !80
  store i32* %arraydecay1, i32** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !82, metadata !DIExpression()), !dbg !84
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !85
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !86
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !87
  store i32 0, i32* %arrayidx4, align 4, !dbg !88
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !89
  %0 = bitcast i32* %arraydecay5 to i8*, !dbg !89
  %1 = load i32*, i32** %data, align 8, !dbg !90
  %2 = bitcast i32* %1 to i8*, !dbg !89
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 400, i1 false), !dbg !89
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !91
  store i32 0, i32* %arrayidx6, align 4, !dbg !92
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !93
  call void @printWLine(i32* %arraydecay7), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !101
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !102
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !105
  store i32* %arraydecay1, i32** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !111
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx4, align 4, !dbg !113
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !114
  %0 = bitcast i32* %arraydecay5 to i8*, !dbg !114
  %1 = load i32*, i32** %data, align 8, !dbg !115
  %2 = bitcast i32* %1 to i8*, !dbg !114
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 400, i1 false), !dbg !114
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx6, align 4, !dbg !117
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  call void @printWLine(i32* %arraydecay7), !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_memmove_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!33 = !DILocalVariable(name: "dest", scope: !34, file: !12, line: 41, type: !22)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!35 = !DILocation(line: 41, column: 17, scope: !34)
!36 = !DILocation(line: 42, column: 17, scope: !34)
!37 = !DILocation(line: 42, column: 9, scope: !34)
!38 = !DILocation(line: 43, column: 9, scope: !34)
!39 = !DILocation(line: 43, column: 21, scope: !34)
!40 = !DILocation(line: 45, column: 9, scope: !34)
!41 = !DILocation(line: 45, column: 23, scope: !34)
!42 = !DILocation(line: 47, column: 9, scope: !34)
!43 = !DILocation(line: 47, column: 21, scope: !34)
!44 = !DILocation(line: 48, column: 20, scope: !34)
!45 = !DILocation(line: 48, column: 9, scope: !34)
!46 = !DILocation(line: 50, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_memmove_15_good", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 118, column: 5, scope: !47)
!49 = !DILocation(line: 119, column: 5, scope: !47)
!50 = !DILocation(line: 120, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 132, type: !52, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!19, !19, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 132, type: !19)
!58 = !DILocation(line: 132, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 132, type: !54)
!60 = !DILocation(line: 132, column: 27, scope: !51)
!61 = !DILocation(line: 135, column: 22, scope: !51)
!62 = !DILocation(line: 135, column: 12, scope: !51)
!63 = !DILocation(line: 135, column: 5, scope: !51)
!64 = !DILocation(line: 137, column: 5, scope: !51)
!65 = !DILocation(line: 138, column: 5, scope: !51)
!66 = !DILocation(line: 139, column: 5, scope: !51)
!67 = !DILocation(line: 142, column: 5, scope: !51)
!68 = !DILocation(line: 143, column: 5, scope: !51)
!69 = !DILocation(line: 144, column: 5, scope: !51)
!70 = !DILocation(line: 146, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 59, type: !16)
!73 = !DILocation(line: 59, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !12, line: 60, type: !22)
!75 = !DILocation(line: 60, column: 13, scope: !71)
!76 = !DILocation(line: 61, column: 13, scope: !71)
!77 = !DILocation(line: 61, column: 5, scope: !71)
!78 = !DILocation(line: 62, column: 5, scope: !71)
!79 = !DILocation(line: 62, column: 23, scope: !71)
!80 = !DILocation(line: 71, column: 16, scope: !71)
!81 = !DILocation(line: 71, column: 14, scope: !71)
!82 = !DILocalVariable(name: "dest", scope: !83, file: !12, line: 75, type: !22)
!83 = distinct !DILexicalBlock(scope: !71, file: !12, line: 74, column: 5)
!84 = !DILocation(line: 75, column: 17, scope: !83)
!85 = !DILocation(line: 76, column: 17, scope: !83)
!86 = !DILocation(line: 76, column: 9, scope: !83)
!87 = !DILocation(line: 77, column: 9, scope: !83)
!88 = !DILocation(line: 77, column: 21, scope: !83)
!89 = !DILocation(line: 79, column: 9, scope: !83)
!90 = !DILocation(line: 79, column: 23, scope: !83)
!91 = !DILocation(line: 81, column: 9, scope: !83)
!92 = !DILocation(line: 81, column: 21, scope: !83)
!93 = !DILocation(line: 82, column: 20, scope: !83)
!94 = !DILocation(line: 82, column: 9, scope: !83)
!95 = !DILocation(line: 84, column: 1, scope: !71)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 89, type: !16)
!98 = !DILocation(line: 89, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !12, line: 90, type: !22)
!100 = !DILocation(line: 90, column: 13, scope: !96)
!101 = !DILocation(line: 91, column: 13, scope: !96)
!102 = !DILocation(line: 91, column: 5, scope: !96)
!103 = !DILocation(line: 92, column: 5, scope: !96)
!104 = !DILocation(line: 92, column: 23, scope: !96)
!105 = !DILocation(line: 97, column: 16, scope: !96)
!106 = !DILocation(line: 97, column: 14, scope: !96)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !12, line: 105, type: !22)
!108 = distinct !DILexicalBlock(scope: !96, file: !12, line: 104, column: 5)
!109 = !DILocation(line: 105, column: 17, scope: !108)
!110 = !DILocation(line: 106, column: 17, scope: !108)
!111 = !DILocation(line: 106, column: 9, scope: !108)
!112 = !DILocation(line: 107, column: 9, scope: !108)
!113 = !DILocation(line: 107, column: 21, scope: !108)
!114 = !DILocation(line: 109, column: 9, scope: !108)
!115 = !DILocation(line: 109, column: 23, scope: !108)
!116 = !DILocation(line: 111, column: 9, scope: !108)
!117 = !DILocation(line: 111, column: 21, scope: !108)
!118 = !DILocation(line: 112, column: 20, scope: !108)
!119 = !DILocation(line: 112, column: 9, scope: !108)
!120 = !DILocation(line: 114, column: 1, scope: !96)
