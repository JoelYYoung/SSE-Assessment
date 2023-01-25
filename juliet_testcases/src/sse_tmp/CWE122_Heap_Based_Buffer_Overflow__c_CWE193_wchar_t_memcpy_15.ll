; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_15_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_15_bad.source to i8*), i64 44, i1 false), !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %4 = bitcast i32* %3 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !39
  %5 = bitcast i32* %arraydecay to i8*, !dbg !39
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !40
  %call2 = call i64 @wcslen(i32* %arraydecay1) #9, !dbg !41
  %add = add i64 %call2, 1, !dbg !42
  %mul = mul i64 %add, 4, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* %6), !dbg !45
  %7 = load i32*, i32** %data, align 8, !dbg !46
  %8 = bitcast i32* %7 to i8*, !dbg !46
  call void @free(i8* %8) #7, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_15_good() #0 !dbg !49 {
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
  %call = call i64 @time(i64* null) #7, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #7, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_15_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_15_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i32* null, i32** %data, align 8, !dbg !76
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !77
  %0 = bitcast i8* %call to i32*, !dbg !78
  store i32* %0, i32** %data, align 8, !dbg !79
  %1 = load i32*, i32** %data, align 8, !dbg !80
  %cmp = icmp eq i32* %1, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !86, metadata !DIExpression()), !dbg !88
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !88
  %3 = load i32*, i32** %data, align 8, !dbg !89
  %4 = bitcast i32* %3 to i8*, !dbg !90
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !90
  %5 = bitcast i32* %arraydecay to i8*, !dbg !90
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !91
  %call2 = call i64 @wcslen(i32* %arraydecay1) #9, !dbg !92
  %add = add i64 %call2, 1, !dbg !93
  %mul = mul i64 %add, 4, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !90
  %6 = load i32*, i32** %data, align 8, !dbg !95
  call void @printWLine(i32* %6), !dbg !96
  %7 = load i32*, i32** %data, align 8, !dbg !97
  %8 = bitcast i32* %7 to i8*, !dbg !97
  call void @free(i8* %8) #7, !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i32* null, i32** %data, align 8, !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !104
  %0 = bitcast i8* %call to i32*, !dbg !105
  store i32* %0, i32** %data, align 8, !dbg !106
  %1 = load i32*, i32** %data, align 8, !dbg !107
  %cmp = icmp eq i32* %1, null, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !115
  %3 = load i32*, i32** %data, align 8, !dbg !116
  %4 = bitcast i32* %3 to i8*, !dbg !117
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !117
  %5 = bitcast i32* %arraydecay to i8*, !dbg !117
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !118
  %call2 = call i64 @wcslen(i32* %arraydecay1) #9, !dbg !119
  %add = add i64 %call2, 1, !dbg !120
  %mul = mul i64 %add, 4, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !117
  %6 = load i32*, i32** %data, align 8, !dbg !122
  call void @printWLine(i32* %6), !dbg !123
  %7 = load i32*, i32** %data, align 8, !dbg !124
  %8 = bitcast i32* %7 to i8*, !dbg !124
  call void @free(i8* %8) #7, !dbg !125
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_15_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 36, column: 27, scope: !16)
!24 = !DILocation(line: 36, column: 16, scope: !16)
!25 = !DILocation(line: 36, column: 14, scope: !16)
!26 = !DILocation(line: 37, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 13)
!28 = !DILocation(line: 37, column: 18, scope: !27)
!29 = !DILocation(line: 37, column: 13, scope: !16)
!30 = !DILocation(line: 37, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 37, column: 27)
!32 = !DILocalVariable(name: "source", scope: !33, file: !17, line: 45, type: !34)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 44, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 45, column: 17, scope: !33)
!38 = !DILocation(line: 48, column: 16, scope: !33)
!39 = !DILocation(line: 48, column: 9, scope: !33)
!40 = !DILocation(line: 48, column: 38, scope: !33)
!41 = !DILocation(line: 48, column: 31, scope: !33)
!42 = !DILocation(line: 48, column: 46, scope: !33)
!43 = !DILocation(line: 48, column: 51, scope: !33)
!44 = !DILocation(line: 49, column: 20, scope: !33)
!45 = !DILocation(line: 49, column: 9, scope: !33)
!46 = !DILocation(line: 50, column: 14, scope: !33)
!47 = !DILocation(line: 50, column: 9, scope: !33)
!48 = !DILocation(line: 52, column: 1, scope: !16)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_15_good", scope: !17, file: !17, line: 112, type: !18, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 114, column: 5, scope: !49)
!51 = !DILocation(line: 115, column: 5, scope: !49)
!52 = !DILocation(line: 116, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 128, type: !54, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!7, !7, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !17, line: 128, type: !7)
!60 = !DILocation(line: 128, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !17, line: 128, type: !56)
!62 = !DILocation(line: 128, column: 27, scope: !53)
!63 = !DILocation(line: 131, column: 22, scope: !53)
!64 = !DILocation(line: 131, column: 12, scope: !53)
!65 = !DILocation(line: 131, column: 5, scope: !53)
!66 = !DILocation(line: 133, column: 5, scope: !53)
!67 = !DILocation(line: 134, column: 5, scope: !53)
!68 = !DILocation(line: 135, column: 5, scope: !53)
!69 = !DILocation(line: 138, column: 5, scope: !53)
!70 = !DILocation(line: 139, column: 5, scope: !53)
!71 = !DILocation(line: 140, column: 5, scope: !53)
!72 = !DILocation(line: 142, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !17, line: 61, type: !4)
!75 = !DILocation(line: 61, column: 15, scope: !73)
!76 = !DILocation(line: 62, column: 10, scope: !73)
!77 = !DILocation(line: 71, column: 27, scope: !73)
!78 = !DILocation(line: 71, column: 16, scope: !73)
!79 = !DILocation(line: 71, column: 14, scope: !73)
!80 = !DILocation(line: 72, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !73, file: !17, line: 72, column: 13)
!82 = !DILocation(line: 72, column: 18, scope: !81)
!83 = !DILocation(line: 72, column: 13, scope: !73)
!84 = !DILocation(line: 72, column: 28, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !17, line: 72, column: 27)
!86 = !DILocalVariable(name: "source", scope: !87, file: !17, line: 76, type: !34)
!87 = distinct !DILexicalBlock(scope: !73, file: !17, line: 75, column: 5)
!88 = !DILocation(line: 76, column: 17, scope: !87)
!89 = !DILocation(line: 79, column: 16, scope: !87)
!90 = !DILocation(line: 79, column: 9, scope: !87)
!91 = !DILocation(line: 79, column: 38, scope: !87)
!92 = !DILocation(line: 79, column: 31, scope: !87)
!93 = !DILocation(line: 79, column: 46, scope: !87)
!94 = !DILocation(line: 79, column: 51, scope: !87)
!95 = !DILocation(line: 80, column: 20, scope: !87)
!96 = !DILocation(line: 80, column: 9, scope: !87)
!97 = !DILocation(line: 81, column: 14, scope: !87)
!98 = !DILocation(line: 81, column: 9, scope: !87)
!99 = !DILocation(line: 83, column: 1, scope: !73)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 86, type: !18, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !17, line: 88, type: !4)
!102 = !DILocation(line: 88, column: 15, scope: !100)
!103 = !DILocation(line: 89, column: 10, scope: !100)
!104 = !DILocation(line: 94, column: 27, scope: !100)
!105 = !DILocation(line: 94, column: 16, scope: !100)
!106 = !DILocation(line: 94, column: 14, scope: !100)
!107 = !DILocation(line: 95, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !17, line: 95, column: 13)
!109 = !DILocation(line: 95, column: 18, scope: !108)
!110 = !DILocation(line: 95, column: 13, scope: !100)
!111 = !DILocation(line: 95, column: 28, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !17, line: 95, column: 27)
!113 = !DILocalVariable(name: "source", scope: !114, file: !17, line: 103, type: !34)
!114 = distinct !DILexicalBlock(scope: !100, file: !17, line: 102, column: 5)
!115 = !DILocation(line: 103, column: 17, scope: !114)
!116 = !DILocation(line: 106, column: 16, scope: !114)
!117 = !DILocation(line: 106, column: 9, scope: !114)
!118 = !DILocation(line: 106, column: 38, scope: !114)
!119 = !DILocation(line: 106, column: 31, scope: !114)
!120 = !DILocation(line: 106, column: 46, scope: !114)
!121 = !DILocation(line: 106, column: 51, scope: !114)
!122 = !DILocation(line: 107, column: 20, scope: !114)
!123 = !DILocation(line: 107, column: 9, scope: !114)
!124 = !DILocation(line: 108, column: 14, scope: !114)
!125 = !DILocation(line: 108, column: 9, scope: !114)
!126 = !DILocation(line: 110, column: 1, scope: !100)
