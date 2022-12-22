; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_42_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_42_bad.source to i8*), i64 44, i1 false), !dbg !31
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !33
  %call1 = call i32* @wcscpy(i32* %2, i32* %arraydecay) #6, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  call void @printWLine(i32* %3), !dbg !36
  %4 = load i32*, i32** %data, align 8, !dbg !37
  %5 = bitcast i32* %4 to i8*, !dbg !37
  call void @free(i8* %5) #6, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !45
  %0 = bitcast i8* %call to i32*, !dbg !46
  store i32* %0, i32** %data.addr, align 8, !dbg !47
  %1 = load i32*, i32** %data.addr, align 8, !dbg !48
  %cmp = icmp eq i32* %1, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !52
  unreachable, !dbg !52

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !54
  ret i32* %2, !dbg !55
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_42_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_42_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_42_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32* null, i32** %data, align 8, !dbg !82
  %0 = load i32*, i32** %data, align 8, !dbg !83
  %call = call i32* @goodG2BSource(i32* %0), !dbg !84
  store i32* %call, i32** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !86, metadata !DIExpression()), !dbg !88
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !88
  %2 = load i32*, i32** %data, align 8, !dbg !89
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !90
  %call1 = call i32* @wcscpy(i32* %2, i32* %arraydecay) #6, !dbg !91
  %3 = load i32*, i32** %data, align 8, !dbg !92
  call void @printWLine(i32* %3), !dbg !93
  %4 = load i32*, i32** %data, align 8, !dbg !94
  %5 = bitcast i32* %4 to i8*, !dbg !94
  call void @free(i8* %5) #6, !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !97 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !100
  %0 = bitcast i8* %call to i32*, !dbg !101
  store i32* %0, i32** %data.addr, align 8, !dbg !102
  %1 = load i32*, i32** %data.addr, align 8, !dbg !103
  %cmp = icmp eq i32* %1, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !109
  ret i32* %2, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_42_bad", scope: !17, file: !17, line: 36, type: !18, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_42.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 38, type: !5)
!21 = !DILocation(line: 38, column: 15, scope: !16)
!22 = !DILocation(line: 39, column: 10, scope: !16)
!23 = !DILocation(line: 40, column: 22, scope: !16)
!24 = !DILocation(line: 40, column: 12, scope: !16)
!25 = !DILocation(line: 40, column: 10, scope: !16)
!26 = !DILocalVariable(name: "source", scope: !27, file: !17, line: 42, type: !28)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 352, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 11)
!31 = !DILocation(line: 42, column: 17, scope: !27)
!32 = !DILocation(line: 44, column: 16, scope: !27)
!33 = !DILocation(line: 44, column: 22, scope: !27)
!34 = !DILocation(line: 44, column: 9, scope: !27)
!35 = !DILocation(line: 45, column: 20, scope: !27)
!36 = !DILocation(line: 45, column: 9, scope: !27)
!37 = !DILocation(line: 46, column: 14, scope: !27)
!38 = !DILocation(line: 46, column: 9, scope: !27)
!39 = !DILocation(line: 48, column: 1, scope: !16)
!40 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 28, type: !41, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!5, !5}
!43 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !17, line: 28, type: !5)
!44 = !DILocation(line: 28, column: 38, scope: !40)
!45 = !DILocation(line: 31, column: 23, scope: !40)
!46 = !DILocation(line: 31, column: 12, scope: !40)
!47 = !DILocation(line: 31, column: 10, scope: !40)
!48 = !DILocation(line: 32, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !40, file: !17, line: 32, column: 9)
!50 = !DILocation(line: 32, column: 14, scope: !49)
!51 = !DILocation(line: 32, column: 9, scope: !40)
!52 = !DILocation(line: 32, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !17, line: 32, column: 23)
!54 = !DILocation(line: 33, column: 12, scope: !40)
!55 = !DILocation(line: 33, column: 5, scope: !40)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_42_good", scope: !17, file: !17, line: 77, type: !18, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 79, column: 5, scope: !56)
!58 = !DILocation(line: 80, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 92, type: !60, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!8, !8, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !17, line: 92, type: !8)
!66 = !DILocation(line: 92, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !17, line: 92, type: !62)
!68 = !DILocation(line: 92, column: 27, scope: !59)
!69 = !DILocation(line: 95, column: 22, scope: !59)
!70 = !DILocation(line: 95, column: 12, scope: !59)
!71 = !DILocation(line: 95, column: 5, scope: !59)
!72 = !DILocation(line: 97, column: 5, scope: !59)
!73 = !DILocation(line: 98, column: 5, scope: !59)
!74 = !DILocation(line: 99, column: 5, scope: !59)
!75 = !DILocation(line: 102, column: 5, scope: !59)
!76 = !DILocation(line: 103, column: 5, scope: !59)
!77 = !DILocation(line: 104, column: 5, scope: !59)
!78 = !DILocation(line: 106, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 63, type: !18, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !17, line: 65, type: !5)
!81 = !DILocation(line: 65, column: 15, scope: !79)
!82 = !DILocation(line: 66, column: 10, scope: !79)
!83 = !DILocation(line: 67, column: 26, scope: !79)
!84 = !DILocation(line: 67, column: 12, scope: !79)
!85 = !DILocation(line: 67, column: 10, scope: !79)
!86 = !DILocalVariable(name: "source", scope: !87, file: !17, line: 69, type: !28)
!87 = distinct !DILexicalBlock(scope: !79, file: !17, line: 68, column: 5)
!88 = !DILocation(line: 69, column: 17, scope: !87)
!89 = !DILocation(line: 71, column: 16, scope: !87)
!90 = !DILocation(line: 71, column: 22, scope: !87)
!91 = !DILocation(line: 71, column: 9, scope: !87)
!92 = !DILocation(line: 72, column: 20, scope: !87)
!93 = !DILocation(line: 72, column: 9, scope: !87)
!94 = !DILocation(line: 73, column: 14, scope: !87)
!95 = !DILocation(line: 73, column: 9, scope: !87)
!96 = !DILocation(line: 75, column: 1, scope: !79)
!97 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 54, type: !41, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !17, line: 54, type: !5)
!99 = !DILocation(line: 54, column: 42, scope: !97)
!100 = !DILocation(line: 57, column: 23, scope: !97)
!101 = !DILocation(line: 57, column: 12, scope: !97)
!102 = !DILocation(line: 57, column: 10, scope: !97)
!103 = !DILocation(line: 58, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !17, line: 58, column: 9)
!105 = !DILocation(line: 58, column: 14, scope: !104)
!106 = !DILocation(line: 58, column: 9, scope: !97)
!107 = !DILocation(line: 58, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !17, line: 58, column: 23)
!109 = !DILocation(line: 59, column: 12, scope: !97)
!110 = !DILocation(line: 59, column: 5, scope: !97)
