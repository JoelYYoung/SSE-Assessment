; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #5, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !37
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %3) #5, !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  call void @printWLine(i32* %4), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #5, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #5, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !73
  store i32* %arraydecay, i32** %data, align 8, !dbg !74
  %0 = load i32*, i32** %data, align 8, !dbg !75
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #5, !dbg !76
  %1 = load i32*, i32** %data, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !79, metadata !DIExpression()), !dbg !81
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !81
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !82
  %3 = load i32*, i32** %data, align 8, !dbg !83
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %3) #5, !dbg !84
  %4 = load i32*, i32** %data, align 8, !dbg !85
  call void @printWLine(i32* %4), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !93
  store i32* %arraydecay, i32** %data, align 8, !dbg !94
  %0 = load i32*, i32** %data, align 8, !dbg !95
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #5, !dbg !96
  %1 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !101
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %3) #5, !dbg !104
  %4 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* %4), !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!38 = !DILocation(line: 43, column: 16, scope: !33)
!39 = !DILocation(line: 43, column: 22, scope: !33)
!40 = !DILocation(line: 43, column: 9, scope: !33)
!41 = !DILocation(line: 44, column: 20, scope: !33)
!42 = !DILocation(line: 44, column: 9, scope: !33)
!43 = !DILocation(line: 46, column: 1, scope: !11)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15_good", scope: !12, file: !12, line: 104, type: !13, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 106, column: 5, scope: !44)
!46 = !DILocation(line: 107, column: 5, scope: !44)
!47 = !DILocation(line: 108, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 120, type: !49, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!19, !19, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 120, type: !19)
!55 = !DILocation(line: 120, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 120, type: !51)
!57 = !DILocation(line: 120, column: 27, scope: !48)
!58 = !DILocation(line: 123, column: 22, scope: !48)
!59 = !DILocation(line: 123, column: 12, scope: !48)
!60 = !DILocation(line: 123, column: 5, scope: !48)
!61 = !DILocation(line: 125, column: 5, scope: !48)
!62 = !DILocation(line: 126, column: 5, scope: !48)
!63 = !DILocation(line: 127, column: 5, scope: !48)
!64 = !DILocation(line: 130, column: 5, scope: !48)
!65 = !DILocation(line: 131, column: 5, scope: !48)
!66 = !DILocation(line: 132, column: 5, scope: !48)
!67 = !DILocation(line: 134, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 55, type: !16)
!70 = !DILocation(line: 55, column: 15, scope: !68)
!71 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !12, line: 56, type: !22)
!72 = !DILocation(line: 56, column: 13, scope: !68)
!73 = !DILocation(line: 57, column: 12, scope: !68)
!74 = !DILocation(line: 57, column: 10, scope: !68)
!75 = !DILocation(line: 66, column: 17, scope: !68)
!76 = !DILocation(line: 66, column: 9, scope: !68)
!77 = !DILocation(line: 67, column: 9, scope: !68)
!78 = !DILocation(line: 67, column: 20, scope: !68)
!79 = !DILocalVariable(name: "dest", scope: !80, file: !12, line: 71, type: !34)
!80 = distinct !DILexicalBlock(scope: !68, file: !12, line: 70, column: 5)
!81 = !DILocation(line: 71, column: 17, scope: !80)
!82 = !DILocation(line: 73, column: 16, scope: !80)
!83 = !DILocation(line: 73, column: 22, scope: !80)
!84 = !DILocation(line: 73, column: 9, scope: !80)
!85 = !DILocation(line: 74, column: 20, scope: !80)
!86 = !DILocation(line: 74, column: 9, scope: !80)
!87 = !DILocation(line: 76, column: 1, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 81, type: !16)
!90 = !DILocation(line: 81, column: 15, scope: !88)
!91 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !12, line: 82, type: !22)
!92 = !DILocation(line: 82, column: 13, scope: !88)
!93 = !DILocation(line: 83, column: 12, scope: !88)
!94 = !DILocation(line: 83, column: 10, scope: !88)
!95 = !DILocation(line: 88, column: 17, scope: !88)
!96 = !DILocation(line: 88, column: 9, scope: !88)
!97 = !DILocation(line: 89, column: 9, scope: !88)
!98 = !DILocation(line: 89, column: 20, scope: !88)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !12, line: 97, type: !34)
!100 = distinct !DILexicalBlock(scope: !88, file: !12, line: 96, column: 5)
!101 = !DILocation(line: 97, column: 17, scope: !100)
!102 = !DILocation(line: 99, column: 16, scope: !100)
!103 = !DILocation(line: 99, column: 22, scope: !100)
!104 = !DILocation(line: 99, column: 9, scope: !100)
!105 = !DILocation(line: 100, column: 20, scope: !100)
!106 = !DILocation(line: 100, column: 9, scope: !100)
!107 = !DILocation(line: 102, column: 1, scope: !88)
