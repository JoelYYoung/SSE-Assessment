; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @badSource(i32* %0), !dbg !29
  store i32* %call, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !36
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !37
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %4 = bitcast i32* %3 to i8*, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !39
  %call2 = call i64 @wcslen(i32* %5) #7, !dbg !40
  %mul = mul i64 %call2, 4, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 4 %4, i64 %mul, i1 false), !dbg !37
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %6 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* %6), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !47 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %0 = load i32*, i32** %data.addr, align 8, !dbg !52
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #8, !dbg !53
  %1 = load i32*, i32** %data.addr, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  %2 = load i32*, i32** %data.addr, align 8, !dbg !56
  ret i32* %2, !dbg !57
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_42_good() #0 !dbg !58 {
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
  %call = call i64 @time(i64* null) #8, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #8, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_42_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_42_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !86
  store i32* %arraydecay, i32** %data, align 8, !dbg !87
  %0 = load i32*, i32** %data, align 8, !dbg !88
  %call = call i32* @goodG2BSource(i32* %0), !dbg !89
  store i32* %call, i32** %data, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !91, metadata !DIExpression()), !dbg !93
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !93
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !94
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !94
  %3 = load i32*, i32** %data, align 8, !dbg !95
  %4 = bitcast i32* %3 to i8*, !dbg !94
  %5 = load i32*, i32** %data, align 8, !dbg !96
  %call2 = call i64 @wcslen(i32* %5) #7, !dbg !97
  %mul = mul i64 %call2, 4, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 4 %4, i64 %mul, i1 false), !dbg !94
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !101
  call void @printWLine(i32* %6), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !104 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = load i32*, i32** %data.addr, align 8, !dbg !107
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #8, !dbg !108
  %1 = load i32*, i32** %data.addr, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %2 = load i32*, i32** %data.addr, align 8, !dbg !111
  ret i32* %2, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_42_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_42.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 33, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 34, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 34, column: 13, scope: !11)
!26 = !DILocation(line: 35, column: 12, scope: !11)
!27 = !DILocation(line: 35, column: 10, scope: !11)
!28 = !DILocation(line: 36, column: 22, scope: !11)
!29 = !DILocation(line: 36, column: 12, scope: !11)
!30 = !DILocation(line: 36, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !12, line: 38, type: !33)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 38, column: 17, scope: !32)
!37 = !DILocation(line: 40, column: 9, scope: !32)
!38 = !DILocation(line: 40, column: 22, scope: !32)
!39 = !DILocation(line: 40, column: 35, scope: !32)
!40 = !DILocation(line: 40, column: 28, scope: !32)
!41 = !DILocation(line: 40, column: 40, scope: !32)
!42 = !DILocation(line: 41, column: 9, scope: !32)
!43 = !DILocation(line: 41, column: 20, scope: !32)
!44 = !DILocation(line: 42, column: 20, scope: !32)
!45 = !DILocation(line: 42, column: 9, scope: !32)
!46 = !DILocation(line: 44, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 23, type: !48, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!16, !16}
!50 = !DILocalVariable(name: "data", arg: 1, scope: !47, file: !12, line: 23, type: !16)
!51 = !DILocation(line: 23, column: 38, scope: !47)
!52 = !DILocation(line: 26, column: 13, scope: !47)
!53 = !DILocation(line: 26, column: 5, scope: !47)
!54 = !DILocation(line: 27, column: 5, scope: !47)
!55 = !DILocation(line: 27, column: 17, scope: !47)
!56 = !DILocation(line: 28, column: 12, scope: !47)
!57 = !DILocation(line: 28, column: 5, scope: !47)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_42_good", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 76, column: 5, scope: !58)
!60 = !DILocation(line: 77, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !62, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!19, !19, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 89, type: !19)
!68 = !DILocation(line: 89, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 89, type: !64)
!70 = !DILocation(line: 89, column: 27, scope: !61)
!71 = !DILocation(line: 92, column: 22, scope: !61)
!72 = !DILocation(line: 92, column: 12, scope: !61)
!73 = !DILocation(line: 92, column: 5, scope: !61)
!74 = !DILocation(line: 94, column: 5, scope: !61)
!75 = !DILocation(line: 95, column: 5, scope: !61)
!76 = !DILocation(line: 96, column: 5, scope: !61)
!77 = !DILocation(line: 99, column: 5, scope: !61)
!78 = !DILocation(line: 100, column: 5, scope: !61)
!79 = !DILocation(line: 101, column: 5, scope: !61)
!80 = !DILocation(line: 103, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 61, type: !16)
!83 = !DILocation(line: 61, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !12, line: 62, type: !22)
!85 = !DILocation(line: 62, column: 13, scope: !81)
!86 = !DILocation(line: 63, column: 12, scope: !81)
!87 = !DILocation(line: 63, column: 10, scope: !81)
!88 = !DILocation(line: 64, column: 26, scope: !81)
!89 = !DILocation(line: 64, column: 12, scope: !81)
!90 = !DILocation(line: 64, column: 10, scope: !81)
!91 = !DILocalVariable(name: "dest", scope: !92, file: !12, line: 66, type: !33)
!92 = distinct !DILexicalBlock(scope: !81, file: !12, line: 65, column: 5)
!93 = !DILocation(line: 66, column: 17, scope: !92)
!94 = !DILocation(line: 68, column: 9, scope: !92)
!95 = !DILocation(line: 68, column: 22, scope: !92)
!96 = !DILocation(line: 68, column: 35, scope: !92)
!97 = !DILocation(line: 68, column: 28, scope: !92)
!98 = !DILocation(line: 68, column: 40, scope: !92)
!99 = !DILocation(line: 69, column: 9, scope: !92)
!100 = !DILocation(line: 69, column: 20, scope: !92)
!101 = !DILocation(line: 70, column: 20, scope: !92)
!102 = !DILocation(line: 70, column: 9, scope: !92)
!103 = !DILocation(line: 72, column: 1, scope: !81)
!104 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 50, type: !48, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", arg: 1, scope: !104, file: !12, line: 50, type: !16)
!106 = !DILocation(line: 50, column: 42, scope: !104)
!107 = !DILocation(line: 53, column: 13, scope: !104)
!108 = !DILocation(line: 53, column: 5, scope: !104)
!109 = !DILocation(line: 54, column: 5, scope: !104)
!110 = !DILocation(line: 54, column: 16, scope: !104)
!111 = !DILocation(line: 55, column: 12, scope: !104)
!112 = !DILocation(line: 55, column: 5, scope: !104)
