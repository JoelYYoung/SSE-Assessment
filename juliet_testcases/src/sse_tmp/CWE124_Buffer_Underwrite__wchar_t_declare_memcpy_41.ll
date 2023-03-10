; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41_badSink(i32* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !27
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !28
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  %0 = load i32*, i32** %data.addr, align 8, !dbg !31
  %1 = bitcast i32* %0 to i8*, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !32
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !32
  %3 = load i32*, i32** %data.addr, align 8, !dbg !33
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !33
  store i32 0, i32* %arrayidx2, align 4, !dbg !34
  %4 = load i32*, i32** %data.addr, align 8, !dbg !35
  call void @printWLine(i32* %4), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41_bad() #0 !dbg !38 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !45
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !46
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx, align 4, !dbg !48
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !49
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !50
  store i32* %add.ptr, i32** %data, align 8, !dbg !51
  %0 = load i32*, i32** %data, align 8, !dbg !52
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41_badSink(i32* %0), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41_goodG2BSink(i32* %data) #0 !dbg !55 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !58, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !61
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !62
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx, align 4, !dbg !64
  %0 = load i32*, i32** %data.addr, align 8, !dbg !65
  %1 = bitcast i32* %0 to i8*, !dbg !66
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !66
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !66
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !66
  %3 = load i32*, i32** %data.addr, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !67
  store i32 0, i32* %arrayidx2, align 4, !dbg !68
  %4 = load i32*, i32** %data.addr, align 8, !dbg !69
  call void @printWLine(i32* %4), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #5, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #5, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !100
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !101
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !104
  store i32* %arraydecay1, i32** %data, align 8, !dbg !105
  %0 = load i32*, i32** %data, align 8, !dbg !106
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41_goodG2BSink(i32* %0), !dbg !107
  ret void, !dbg !108
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!20 = !DILocation(line: 23, column: 76, scope: !11)
!21 = !DILocalVariable(name: "source", scope: !22, file: !12, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 26, column: 17, scope: !22)
!27 = !DILocation(line: 27, column: 17, scope: !22)
!28 = !DILocation(line: 27, column: 9, scope: !22)
!29 = !DILocation(line: 28, column: 9, scope: !22)
!30 = !DILocation(line: 28, column: 23, scope: !22)
!31 = !DILocation(line: 30, column: 16, scope: !22)
!32 = !DILocation(line: 30, column: 9, scope: !22)
!33 = !DILocation(line: 32, column: 9, scope: !22)
!34 = !DILocation(line: 32, column: 21, scope: !22)
!35 = !DILocation(line: 33, column: 20, scope: !22)
!36 = !DILocation(line: 33, column: 9, scope: !22)
!37 = !DILocation(line: 35, column: 1, scope: !11)
!38 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41_bad", scope: !12, file: !12, line: 37, type: !39, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !DILocalVariable(name: "data", scope: !38, file: !12, line: 39, type: !15)
!42 = !DILocation(line: 39, column: 15, scope: !38)
!43 = !DILocalVariable(name: "dataBuffer", scope: !38, file: !12, line: 40, type: !23)
!44 = !DILocation(line: 40, column: 13, scope: !38)
!45 = !DILocation(line: 41, column: 13, scope: !38)
!46 = !DILocation(line: 41, column: 5, scope: !38)
!47 = !DILocation(line: 42, column: 5, scope: !38)
!48 = !DILocation(line: 42, column: 23, scope: !38)
!49 = !DILocation(line: 44, column: 12, scope: !38)
!50 = !DILocation(line: 44, column: 23, scope: !38)
!51 = !DILocation(line: 44, column: 10, scope: !38)
!52 = !DILocation(line: 45, column: 65, scope: !38)
!53 = !DILocation(line: 45, column: 5, scope: !38)
!54 = !DILocation(line: 46, column: 1, scope: !38)
!55 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41_goodG2BSink", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "data", arg: 1, scope: !55, file: !12, line: 52, type: !15)
!57 = !DILocation(line: 52, column: 80, scope: !55)
!58 = !DILocalVariable(name: "source", scope: !59, file: !12, line: 55, type: !23)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 54, column: 5)
!60 = !DILocation(line: 55, column: 17, scope: !59)
!61 = !DILocation(line: 56, column: 17, scope: !59)
!62 = !DILocation(line: 56, column: 9, scope: !59)
!63 = !DILocation(line: 57, column: 9, scope: !59)
!64 = !DILocation(line: 57, column: 23, scope: !59)
!65 = !DILocation(line: 59, column: 16, scope: !59)
!66 = !DILocation(line: 59, column: 9, scope: !59)
!67 = !DILocation(line: 61, column: 9, scope: !59)
!68 = !DILocation(line: 61, column: 21, scope: !59)
!69 = !DILocation(line: 62, column: 20, scope: !59)
!70 = !DILocation(line: 62, column: 9, scope: !59)
!71 = !DILocation(line: 64, column: 1, scope: !55)
!72 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_41_good", scope: !12, file: !12, line: 78, type: !39, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 80, column: 5, scope: !72)
!74 = !DILocation(line: 81, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 93, type: !76, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!18, !18, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 93, type: !18)
!82 = !DILocation(line: 93, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 93, type: !78)
!84 = !DILocation(line: 93, column: 27, scope: !75)
!85 = !DILocation(line: 96, column: 22, scope: !75)
!86 = !DILocation(line: 96, column: 12, scope: !75)
!87 = !DILocation(line: 96, column: 5, scope: !75)
!88 = !DILocation(line: 98, column: 5, scope: !75)
!89 = !DILocation(line: 99, column: 5, scope: !75)
!90 = !DILocation(line: 100, column: 5, scope: !75)
!91 = !DILocation(line: 103, column: 5, scope: !75)
!92 = !DILocation(line: 104, column: 5, scope: !75)
!93 = !DILocation(line: 105, column: 5, scope: !75)
!94 = !DILocation(line: 107, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !39, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 69, type: !15)
!97 = !DILocation(line: 69, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !12, line: 70, type: !23)
!99 = !DILocation(line: 70, column: 13, scope: !95)
!100 = !DILocation(line: 71, column: 13, scope: !95)
!101 = !DILocation(line: 71, column: 5, scope: !95)
!102 = !DILocation(line: 72, column: 5, scope: !95)
!103 = !DILocation(line: 72, column: 23, scope: !95)
!104 = !DILocation(line: 74, column: 12, scope: !95)
!105 = !DILocation(line: 74, column: 10, scope: !95)
!106 = !DILocation(line: 75, column: 69, scope: !95)
!107 = !DILocation(line: 75, column: 5, scope: !95)
!108 = !DILocation(line: 76, column: 1, scope: !95)
