; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #7, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !37
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !38
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !38
  %4 = load i32*, i32** %data, align 8, !dbg !39
  %5 = bitcast i32* %4 to i8*, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %call2 = call i64 @wcslen(i32* %6) #8, !dbg !41
  %mul = mul i64 %call2, 4, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 4 %5, i64 %mul, i1 false), !dbg !38
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !43
  store i32 0, i32* %arrayidx3, align 4, !dbg !44
  %7 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* %7), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_15_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #7, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #7, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_15_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_15_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !77
  store i32* %arraydecay, i32** %data, align 8, !dbg !78
  %0 = load i32*, i32** %data, align 8, !dbg !79
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #7, !dbg !80
  %1 = load i32*, i32** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !81
  store i32 0, i32* %arrayidx, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !83, metadata !DIExpression()), !dbg !85
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !85
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !86
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !86
  %4 = load i32*, i32** %data, align 8, !dbg !87
  %5 = bitcast i32* %4 to i8*, !dbg !86
  %6 = load i32*, i32** %data, align 8, !dbg !88
  %call2 = call i64 @wcslen(i32* %6) #8, !dbg !89
  %mul = mul i64 %call2, 4, !dbg !90
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 4 %5, i64 %mul, i1 false), !dbg !86
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !91
  store i32 0, i32* %arrayidx3, align 4, !dbg !92
  %7 = load i32*, i32** %data, align 8, !dbg !93
  call void @printWLine(i32* %7), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !101
  store i32* %arraydecay, i32** %data, align 8, !dbg !102
  %0 = load i32*, i32** %data, align 8, !dbg !103
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #7, !dbg !104
  %1 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !109
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !110
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !110
  %4 = load i32*, i32** %data, align 8, !dbg !111
  %5 = bitcast i32* %4 to i8*, !dbg !110
  %6 = load i32*, i32** %data, align 8, !dbg !112
  %call2 = call i64 @wcslen(i32* %6) #8, !dbg !113
  %mul = mul i64 %call2, 4, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 4 %5, i64 %mul, i1 false), !dbg !110
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !115
  store i32 0, i32* %arrayidx3, align 4, !dbg !116
  %7 = load i32*, i32** %data, align 8, !dbg !117
  call void @printWLine(i32* %7), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_15.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 12, scope: !11)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocation(line: 32, column: 17, scope: !11)
!29 = !DILocation(line: 32, column: 9, scope: !11)
!30 = !DILocation(line: 33, column: 9, scope: !11)
!31 = !DILocation(line: 33, column: 21, scope: !11)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !12, line: 41, type: !34)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 41, column: 17, scope: !33)
!38 = !DILocation(line: 43, column: 9, scope: !33)
!39 = !DILocation(line: 43, column: 22, scope: !33)
!40 = !DILocation(line: 43, column: 35, scope: !33)
!41 = !DILocation(line: 43, column: 28, scope: !33)
!42 = !DILocation(line: 43, column: 40, scope: !33)
!43 = !DILocation(line: 44, column: 9, scope: !33)
!44 = !DILocation(line: 44, column: 20, scope: !33)
!45 = !DILocation(line: 45, column: 20, scope: !33)
!46 = !DILocation(line: 45, column: 9, scope: !33)
!47 = !DILocation(line: 47, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_15_good", scope: !12, file: !12, line: 107, type: !13, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 109, column: 5, scope: !48)
!50 = !DILocation(line: 110, column: 5, scope: !48)
!51 = !DILocation(line: 111, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 123, type: !53, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!19, !19, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 123, type: !19)
!59 = !DILocation(line: 123, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 123, type: !55)
!61 = !DILocation(line: 123, column: 27, scope: !52)
!62 = !DILocation(line: 126, column: 22, scope: !52)
!63 = !DILocation(line: 126, column: 12, scope: !52)
!64 = !DILocation(line: 126, column: 5, scope: !52)
!65 = !DILocation(line: 128, column: 5, scope: !52)
!66 = !DILocation(line: 129, column: 5, scope: !52)
!67 = !DILocation(line: 130, column: 5, scope: !52)
!68 = !DILocation(line: 133, column: 5, scope: !52)
!69 = !DILocation(line: 134, column: 5, scope: !52)
!70 = !DILocation(line: 135, column: 5, scope: !52)
!71 = !DILocation(line: 137, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 56, type: !16)
!74 = !DILocation(line: 56, column: 15, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !12, line: 57, type: !22)
!76 = !DILocation(line: 57, column: 13, scope: !72)
!77 = !DILocation(line: 58, column: 12, scope: !72)
!78 = !DILocation(line: 58, column: 10, scope: !72)
!79 = !DILocation(line: 67, column: 17, scope: !72)
!80 = !DILocation(line: 67, column: 9, scope: !72)
!81 = !DILocation(line: 68, column: 9, scope: !72)
!82 = !DILocation(line: 68, column: 20, scope: !72)
!83 = !DILocalVariable(name: "dest", scope: !84, file: !12, line: 72, type: !34)
!84 = distinct !DILexicalBlock(scope: !72, file: !12, line: 71, column: 5)
!85 = !DILocation(line: 72, column: 17, scope: !84)
!86 = !DILocation(line: 74, column: 9, scope: !84)
!87 = !DILocation(line: 74, column: 22, scope: !84)
!88 = !DILocation(line: 74, column: 35, scope: !84)
!89 = !DILocation(line: 74, column: 28, scope: !84)
!90 = !DILocation(line: 74, column: 40, scope: !84)
!91 = !DILocation(line: 75, column: 9, scope: !84)
!92 = !DILocation(line: 75, column: 20, scope: !84)
!93 = !DILocation(line: 76, column: 20, scope: !84)
!94 = !DILocation(line: 76, column: 9, scope: !84)
!95 = !DILocation(line: 78, column: 1, scope: !72)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 83, type: !16)
!98 = !DILocation(line: 83, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !12, line: 84, type: !22)
!100 = !DILocation(line: 84, column: 13, scope: !96)
!101 = !DILocation(line: 85, column: 12, scope: !96)
!102 = !DILocation(line: 85, column: 10, scope: !96)
!103 = !DILocation(line: 90, column: 17, scope: !96)
!104 = !DILocation(line: 90, column: 9, scope: !96)
!105 = !DILocation(line: 91, column: 9, scope: !96)
!106 = !DILocation(line: 91, column: 20, scope: !96)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !12, line: 99, type: !34)
!108 = distinct !DILexicalBlock(scope: !96, file: !12, line: 98, column: 5)
!109 = !DILocation(line: 99, column: 17, scope: !108)
!110 = !DILocation(line: 101, column: 9, scope: !108)
!111 = !DILocation(line: 101, column: 22, scope: !108)
!112 = !DILocation(line: 101, column: 35, scope: !108)
!113 = !DILocation(line: 101, column: 28, scope: !108)
!114 = !DILocation(line: 101, column: 40, scope: !108)
!115 = !DILocation(line: 102, column: 9, scope: !108)
!116 = !DILocation(line: 102, column: 20, scope: !108)
!117 = !DILocation(line: 103, column: 20, scope: !108)
!118 = !DILocation(line: 103, column: 9, scope: !108)
!119 = !DILocation(line: 105, column: 1, scope: !96)
