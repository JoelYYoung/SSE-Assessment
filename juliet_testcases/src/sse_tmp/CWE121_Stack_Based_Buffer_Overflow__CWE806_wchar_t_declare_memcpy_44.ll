; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #7, !dbg !34
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  call void %2(i32* %3), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !48
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !49
  %1 = bitcast i32* %arraydecay to i8*, !dbg !49
  %2 = load i32*, i32** %data.addr, align 8, !dbg !50
  %3 = bitcast i32* %2 to i8*, !dbg !49
  %4 = load i32*, i32** %data.addr, align 8, !dbg !51
  %call = call i64 @wcslen(i32* %4) #8, !dbg !52
  %mul = mul i64 %call, 4, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !49
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  %5 = load i32*, i32** %data.addr, align 8, !dbg !56
  call void @printWLine(i32* %5), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_44_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_44_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_44_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !85, metadata !DIExpression()), !dbg !86
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !89
  store i32* %arraydecay, i32** %data, align 8, !dbg !90
  %0 = load i32*, i32** %data, align 8, !dbg !91
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #7, !dbg !92
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !95
  %3 = load i32*, i32** %data, align 8, !dbg !96
  call void %2(i32* %3), !dbg !95
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !98 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !103
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !104
  %1 = bitcast i32* %arraydecay to i8*, !dbg !104
  %2 = load i32*, i32** %data.addr, align 8, !dbg !105
  %3 = bitcast i32* %2 to i8*, !dbg !104
  %4 = load i32*, i32** %data.addr, align 8, !dbg !106
  %call = call i64 @wcslen(i32* %4) #8, !dbg !107
  %mul = mul i64 %call, 4, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !104
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %5 = load i32*, i32** %data.addr, align 8, !dbg !111
  call void @printWLine(i32* %5), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_44_bad", scope: !12, file: !12, line: 34, type: !13, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 36, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 36, column: 15, scope: !11)
!21 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 38, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !16}
!25 = !DILocation(line: 38, column: 12, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 39, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 39, column: 13, scope: !11)
!31 = !DILocation(line: 40, column: 12, scope: !11)
!32 = !DILocation(line: 40, column: 10, scope: !11)
!33 = !DILocation(line: 42, column: 13, scope: !11)
!34 = !DILocation(line: 42, column: 5, scope: !11)
!35 = !DILocation(line: 43, column: 5, scope: !11)
!36 = !DILocation(line: 43, column: 17, scope: !11)
!37 = !DILocation(line: 45, column: 5, scope: !11)
!38 = !DILocation(line: 45, column: 13, scope: !11)
!39 = !DILocation(line: 46, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !12, line: 23, type: !16)
!42 = !DILocation(line: 23, column: 31, scope: !40)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !12, line: 26, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 25, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 26, column: 17, scope: !44)
!49 = !DILocation(line: 28, column: 9, scope: !44)
!50 = !DILocation(line: 28, column: 22, scope: !44)
!51 = !DILocation(line: 28, column: 35, scope: !44)
!52 = !DILocation(line: 28, column: 28, scope: !44)
!53 = !DILocation(line: 28, column: 40, scope: !44)
!54 = !DILocation(line: 29, column: 9, scope: !44)
!55 = !DILocation(line: 29, column: 20, scope: !44)
!56 = !DILocation(line: 30, column: 20, scope: !44)
!57 = !DILocation(line: 30, column: 9, scope: !44)
!58 = !DILocation(line: 32, column: 1, scope: !40)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_44_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 78, column: 5, scope: !59)
!61 = !DILocation(line: 79, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !63, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!19, !19, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 90, type: !19)
!69 = !DILocation(line: 90, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 90, type: !65)
!71 = !DILocation(line: 90, column: 27, scope: !62)
!72 = !DILocation(line: 93, column: 22, scope: !62)
!73 = !DILocation(line: 93, column: 12, scope: !62)
!74 = !DILocation(line: 93, column: 5, scope: !62)
!75 = !DILocation(line: 95, column: 5, scope: !62)
!76 = !DILocation(line: 96, column: 5, scope: !62)
!77 = !DILocation(line: 97, column: 5, scope: !62)
!78 = !DILocation(line: 100, column: 5, scope: !62)
!79 = !DILocation(line: 101, column: 5, scope: !62)
!80 = !DILocation(line: 102, column: 5, scope: !62)
!81 = !DILocation(line: 104, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 64, type: !13, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 66, type: !16)
!84 = !DILocation(line: 66, column: 15, scope: !82)
!85 = !DILocalVariable(name: "funcPtr", scope: !82, file: !12, line: 67, type: !22)
!86 = !DILocation(line: 67, column: 12, scope: !82)
!87 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !12, line: 68, type: !27)
!88 = !DILocation(line: 68, column: 13, scope: !82)
!89 = !DILocation(line: 69, column: 12, scope: !82)
!90 = !DILocation(line: 69, column: 10, scope: !82)
!91 = !DILocation(line: 71, column: 13, scope: !82)
!92 = !DILocation(line: 71, column: 5, scope: !82)
!93 = !DILocation(line: 72, column: 5, scope: !82)
!94 = !DILocation(line: 72, column: 16, scope: !82)
!95 = !DILocation(line: 73, column: 5, scope: !82)
!96 = !DILocation(line: 73, column: 13, scope: !82)
!97 = !DILocation(line: 74, column: 1, scope: !82)
!98 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 53, type: !23, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", arg: 1, scope: !98, file: !12, line: 53, type: !16)
!100 = !DILocation(line: 53, column: 35, scope: !98)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !12, line: 56, type: !45)
!102 = distinct !DILexicalBlock(scope: !98, file: !12, line: 55, column: 5)
!103 = !DILocation(line: 56, column: 17, scope: !102)
!104 = !DILocation(line: 58, column: 9, scope: !102)
!105 = !DILocation(line: 58, column: 22, scope: !102)
!106 = !DILocation(line: 58, column: 35, scope: !102)
!107 = !DILocation(line: 58, column: 28, scope: !102)
!108 = !DILocation(line: 58, column: 40, scope: !102)
!109 = !DILocation(line: 59, column: 9, scope: !102)
!110 = !DILocation(line: 59, column: 20, scope: !102)
!111 = !DILocation(line: 60, column: 20, scope: !102)
!112 = !DILocation(line: 60, column: 9, scope: !102)
!113 = !DILocation(line: 62, column: 1, scope: !98)
