; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !34, metadata !DIExpression()), !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %3, i32** %dataCopy, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !38, metadata !DIExpression()), !dbg !39
  %4 = load i32*, i32** %dataCopy, align 8, !dbg !40
  store i32* %4, i32** %data1, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx3, align 4, !dbg !50
  %5 = load i32*, i32** %data1, align 8, !dbg !51
  %6 = bitcast i32* %5 to i8*, !dbg !52
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !52
  %8 = load i32*, i32** %data1, align 8, !dbg !53
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !53
  store i32 0, i32* %arrayidx5, align 4, !dbg !54
  %9 = load i32*, i32** %data1, align 8, !dbg !55
  call void @printWLine(i32* %9), !dbg !56
  %10 = load i32*, i32** %data1, align 8, !dbg !57
  %11 = bitcast i32* %10 to i8*, !dbg !57
  call void @free(i8* %11) #6, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_31_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #6, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #6, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_31_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_31_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32* null, i32** %data, align 8, !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !87
  %0 = bitcast i8* %call to i32*, !dbg !88
  store i32* %0, i32** %data, align 8, !dbg !89
  %1 = load i32*, i32** %data, align 8, !dbg !90
  %cmp = icmp eq i32* %1, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !98, metadata !DIExpression()), !dbg !100
  %3 = load i32*, i32** %data, align 8, !dbg !101
  store i32* %3, i32** %dataCopy, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !102, metadata !DIExpression()), !dbg !103
  %4 = load i32*, i32** %dataCopy, align 8, !dbg !104
  store i32* %4, i32** %data1, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !109
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx3, align 4, !dbg !111
  %5 = load i32*, i32** %data1, align 8, !dbg !112
  %6 = bitcast i32* %5 to i8*, !dbg !113
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !113
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !113
  %8 = load i32*, i32** %data1, align 8, !dbg !114
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !114
  store i32 0, i32* %arrayidx5, align 4, !dbg !115
  %9 = load i32*, i32** %data1, align 8, !dbg !116
  call void @printWLine(i32* %9), !dbg !117
  %10 = load i32*, i32** %data1, align 8, !dbg !118
  %11 = bitcast i32* %10 to i8*, !dbg !118
  call void @free(i8* %11) #6, !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_31_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_31.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 28, column: 23, scope: !16)
!24 = !DILocation(line: 28, column: 12, scope: !16)
!25 = !DILocation(line: 28, column: 10, scope: !16)
!26 = !DILocation(line: 29, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 9)
!28 = !DILocation(line: 29, column: 14, scope: !27)
!29 = !DILocation(line: 29, column: 9, scope: !16)
!30 = !DILocation(line: 29, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 29, column: 23)
!32 = !DILocation(line: 30, column: 5, scope: !16)
!33 = !DILocation(line: 30, column: 13, scope: !16)
!34 = !DILocalVariable(name: "dataCopy", scope: !35, file: !17, line: 32, type: !4)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 5)
!36 = !DILocation(line: 32, column: 19, scope: !35)
!37 = !DILocation(line: 32, column: 30, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !17, line: 33, type: !4)
!39 = !DILocation(line: 33, column: 19, scope: !35)
!40 = !DILocation(line: 33, column: 26, scope: !35)
!41 = !DILocalVariable(name: "source", scope: !42, file: !17, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !35, file: !17, line: 34, column: 9)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 35, column: 21, scope: !42)
!47 = !DILocation(line: 36, column: 21, scope: !42)
!48 = !DILocation(line: 36, column: 13, scope: !42)
!49 = !DILocation(line: 37, column: 13, scope: !42)
!50 = !DILocation(line: 37, column: 27, scope: !42)
!51 = !DILocation(line: 39, column: 20, scope: !42)
!52 = !DILocation(line: 39, column: 13, scope: !42)
!53 = !DILocation(line: 40, column: 13, scope: !42)
!54 = !DILocation(line: 40, column: 25, scope: !42)
!55 = !DILocation(line: 41, column: 24, scope: !42)
!56 = !DILocation(line: 41, column: 13, scope: !42)
!57 = !DILocation(line: 42, column: 18, scope: !42)
!58 = !DILocation(line: 42, column: 13, scope: !42)
!59 = !DILocation(line: 45, column: 1, scope: !16)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_31_good", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 78, column: 5, scope: !60)
!62 = !DILocation(line: 79, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 90, type: !64, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !17, line: 90, type: !7)
!70 = !DILocation(line: 90, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !17, line: 90, type: !66)
!72 = !DILocation(line: 90, column: 27, scope: !63)
!73 = !DILocation(line: 93, column: 22, scope: !63)
!74 = !DILocation(line: 93, column: 12, scope: !63)
!75 = !DILocation(line: 93, column: 5, scope: !63)
!76 = !DILocation(line: 95, column: 5, scope: !63)
!77 = !DILocation(line: 96, column: 5, scope: !63)
!78 = !DILocation(line: 97, column: 5, scope: !63)
!79 = !DILocation(line: 100, column: 5, scope: !63)
!80 = !DILocation(line: 101, column: 5, scope: !63)
!81 = !DILocation(line: 102, column: 5, scope: !63)
!82 = !DILocation(line: 104, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 52, type: !18, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !17, line: 54, type: !4)
!85 = !DILocation(line: 54, column: 15, scope: !83)
!86 = !DILocation(line: 55, column: 10, scope: !83)
!87 = !DILocation(line: 57, column: 23, scope: !83)
!88 = !DILocation(line: 57, column: 12, scope: !83)
!89 = !DILocation(line: 57, column: 10, scope: !83)
!90 = !DILocation(line: 58, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !83, file: !17, line: 58, column: 9)
!92 = !DILocation(line: 58, column: 14, scope: !91)
!93 = !DILocation(line: 58, column: 9, scope: !83)
!94 = !DILocation(line: 58, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !17, line: 58, column: 23)
!96 = !DILocation(line: 59, column: 5, scope: !83)
!97 = !DILocation(line: 59, column: 13, scope: !83)
!98 = !DILocalVariable(name: "dataCopy", scope: !99, file: !17, line: 61, type: !4)
!99 = distinct !DILexicalBlock(scope: !83, file: !17, line: 60, column: 5)
!100 = !DILocation(line: 61, column: 19, scope: !99)
!101 = !DILocation(line: 61, column: 30, scope: !99)
!102 = !DILocalVariable(name: "data", scope: !99, file: !17, line: 62, type: !4)
!103 = !DILocation(line: 62, column: 19, scope: !99)
!104 = !DILocation(line: 62, column: 26, scope: !99)
!105 = !DILocalVariable(name: "source", scope: !106, file: !17, line: 64, type: !43)
!106 = distinct !DILexicalBlock(scope: !99, file: !17, line: 63, column: 9)
!107 = !DILocation(line: 64, column: 21, scope: !106)
!108 = !DILocation(line: 65, column: 21, scope: !106)
!109 = !DILocation(line: 65, column: 13, scope: !106)
!110 = !DILocation(line: 66, column: 13, scope: !106)
!111 = !DILocation(line: 66, column: 27, scope: !106)
!112 = !DILocation(line: 68, column: 20, scope: !106)
!113 = !DILocation(line: 68, column: 13, scope: !106)
!114 = !DILocation(line: 69, column: 13, scope: !106)
!115 = !DILocation(line: 69, column: 25, scope: !106)
!116 = !DILocation(line: 70, column: 24, scope: !106)
!117 = !DILocation(line: 70, column: 13, scope: !106)
!118 = !DILocation(line: 71, column: 18, scope: !106)
!119 = !DILocation(line: 71, column: 13, scope: !106)
!120 = !DILocation(line: 74, column: 1, scope: !83)
