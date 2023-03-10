; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_44.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !35
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !36
  store i32* %add.ptr, i32** %data, align 8, !dbg !37
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !38
  %1 = load i32*, i32** %data, align 8, !dbg !39
  call void %0(i32* %1), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !48
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx, align 4, !dbg !50
  %0 = load i32*, i32** %data.addr, align 8, !dbg !51
  %1 = bitcast i32* %0 to i8*, !dbg !52
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !52
  %3 = load i32*, i32** %data.addr, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !53
  store i32 0, i32* %arrayidx2, align 4, !dbg !54
  %4 = load i32*, i32** %data.addr, align 8, !dbg !55
  call void @printWLine(i32* %4), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_44_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #5, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #5, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_44_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_44_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !84, metadata !DIExpression()), !dbg !85
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !88
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !89
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !92
  store i32* %arraydecay1, i32** %data, align 8, !dbg !93
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  call void %0(i32* %1), !dbg !94
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !97 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !103
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !104
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %0 = load i32*, i32** %data.addr, align 8, !dbg !107
  %1 = bitcast i32* %0 to i8*, !dbg !108
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !108
  %3 = load i32*, i32** %data.addr, align 8, !dbg !109
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !109
  store i32 0, i32* %arrayidx2, align 4, !dbg !110
  %4 = load i32*, i32** %data.addr, align 8, !dbg !111
  call void @printWLine(i32* %4), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_44_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 41, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !16}
!25 = !DILocation(line: 41, column: 12, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 42, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 42, column: 13, scope: !11)
!31 = !DILocation(line: 43, column: 13, scope: !11)
!32 = !DILocation(line: 43, column: 5, scope: !11)
!33 = !DILocation(line: 44, column: 5, scope: !11)
!34 = !DILocation(line: 44, column: 23, scope: !11)
!35 = !DILocation(line: 46, column: 12, scope: !11)
!36 = !DILocation(line: 46, column: 23, scope: !11)
!37 = !DILocation(line: 46, column: 10, scope: !11)
!38 = !DILocation(line: 48, column: 5, scope: !11)
!39 = !DILocation(line: 48, column: 13, scope: !11)
!40 = !DILocation(line: 49, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !12, line: 23, type: !16)
!43 = !DILocation(line: 23, column: 31, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !12, line: 26, type: !27)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 25, column: 5)
!46 = !DILocation(line: 26, column: 17, scope: !45)
!47 = !DILocation(line: 27, column: 17, scope: !45)
!48 = !DILocation(line: 27, column: 9, scope: !45)
!49 = !DILocation(line: 28, column: 9, scope: !45)
!50 = !DILocation(line: 28, column: 23, scope: !45)
!51 = !DILocation(line: 30, column: 16, scope: !45)
!52 = !DILocation(line: 30, column: 9, scope: !45)
!53 = !DILocation(line: 32, column: 9, scope: !45)
!54 = !DILocation(line: 32, column: 21, scope: !45)
!55 = !DILocation(line: 33, column: 20, scope: !45)
!56 = !DILocation(line: 33, column: 9, scope: !45)
!57 = !DILocation(line: 35, column: 1, scope: !41)
!58 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_44_good", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 84, column: 5, scope: !58)
!60 = !DILocation(line: 85, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !62, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!19, !19, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 96, type: !19)
!68 = !DILocation(line: 96, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 96, type: !64)
!70 = !DILocation(line: 96, column: 27, scope: !61)
!71 = !DILocation(line: 99, column: 22, scope: !61)
!72 = !DILocation(line: 99, column: 12, scope: !61)
!73 = !DILocation(line: 99, column: 5, scope: !61)
!74 = !DILocation(line: 101, column: 5, scope: !61)
!75 = !DILocation(line: 102, column: 5, scope: !61)
!76 = !DILocation(line: 103, column: 5, scope: !61)
!77 = !DILocation(line: 106, column: 5, scope: !61)
!78 = !DILocation(line: 107, column: 5, scope: !61)
!79 = !DILocation(line: 108, column: 5, scope: !61)
!80 = !DILocation(line: 110, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 70, type: !13, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 72, type: !16)
!83 = !DILocation(line: 72, column: 15, scope: !81)
!84 = !DILocalVariable(name: "funcPtr", scope: !81, file: !12, line: 73, type: !22)
!85 = !DILocation(line: 73, column: 12, scope: !81)
!86 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !12, line: 74, type: !27)
!87 = !DILocation(line: 74, column: 13, scope: !81)
!88 = !DILocation(line: 75, column: 13, scope: !81)
!89 = !DILocation(line: 75, column: 5, scope: !81)
!90 = !DILocation(line: 76, column: 5, scope: !81)
!91 = !DILocation(line: 76, column: 23, scope: !81)
!92 = !DILocation(line: 78, column: 12, scope: !81)
!93 = !DILocation(line: 78, column: 10, scope: !81)
!94 = !DILocation(line: 79, column: 5, scope: !81)
!95 = !DILocation(line: 79, column: 13, scope: !81)
!96 = !DILocation(line: 80, column: 1, scope: !81)
!97 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 56, type: !23, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !12, line: 56, type: !16)
!99 = !DILocation(line: 56, column: 35, scope: !97)
!100 = !DILocalVariable(name: "source", scope: !101, file: !12, line: 59, type: !27)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 58, column: 5)
!102 = !DILocation(line: 59, column: 17, scope: !101)
!103 = !DILocation(line: 60, column: 17, scope: !101)
!104 = !DILocation(line: 60, column: 9, scope: !101)
!105 = !DILocation(line: 61, column: 9, scope: !101)
!106 = !DILocation(line: 61, column: 23, scope: !101)
!107 = !DILocation(line: 63, column: 16, scope: !101)
!108 = !DILocation(line: 63, column: 9, scope: !101)
!109 = !DILocation(line: 65, column: 9, scope: !101)
!110 = !DILocation(line: 65, column: 21, scope: !101)
!111 = !DILocation(line: 66, column: 20, scope: !101)
!112 = !DILocation(line: 66, column: 9, scope: !101)
!113 = !DILocation(line: 68, column: 1, scope: !97)
