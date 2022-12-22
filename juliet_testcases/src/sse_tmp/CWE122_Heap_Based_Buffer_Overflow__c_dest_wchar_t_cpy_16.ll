; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_16_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  br label %while.body, !dbg !23

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !24
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  br label %while.end, !dbg !36

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx2, align 4, !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call4 = call i32* @wcscpy(i32* %3, i32* %arraydecay3) #5, !dbg !49
  %4 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %4), !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !52
  %6 = bitcast i32* %5 to i8*, !dbg !52
  call void @free(i8* %6) #5, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_16_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_16_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_16_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i32* null, i32** %data, align 8, !dbg !81
  br label %while.body, !dbg !82

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !83
  %0 = bitcast i8* %call to i32*, !dbg !85
  store i32* %0, i32** %data, align 8, !dbg !86
  %1 = load i32*, i32** %data, align 8, !dbg !87
  %cmp = icmp eq i32* %1, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  br label %while.end, !dbg !95

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !99
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !100
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx2, align 4, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !104
  %call4 = call i32* @wcscpy(i32* %3, i32* %arraydecay3) #5, !dbg !105
  %4 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* %4), !dbg !107
  %5 = load i32*, i32** %data, align 8, !dbg !108
  %6 = bitcast i32* %5 to i8*, !dbg !108
  call void @free(i8* %6) #5, !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_16.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_16_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_16.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 5, scope: !16)
!24 = !DILocation(line: 30, column: 27, scope: !25)
!25 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 5)
!26 = !DILocation(line: 30, column: 16, scope: !25)
!27 = !DILocation(line: 30, column: 14, scope: !25)
!28 = !DILocation(line: 31, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !17, line: 31, column: 13)
!30 = !DILocation(line: 31, column: 18, scope: !29)
!31 = !DILocation(line: 31, column: 13, scope: !25)
!32 = !DILocation(line: 31, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 31, column: 27)
!34 = !DILocation(line: 32, column: 9, scope: !25)
!35 = !DILocation(line: 32, column: 17, scope: !25)
!36 = !DILocation(line: 33, column: 9, scope: !25)
!37 = !DILocalVariable(name: "source", scope: !38, file: !17, line: 36, type: !39)
!38 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 36, column: 17, scope: !38)
!43 = !DILocation(line: 37, column: 17, scope: !38)
!44 = !DILocation(line: 37, column: 9, scope: !38)
!45 = !DILocation(line: 38, column: 9, scope: !38)
!46 = !DILocation(line: 38, column: 23, scope: !38)
!47 = !DILocation(line: 40, column: 16, scope: !38)
!48 = !DILocation(line: 40, column: 22, scope: !38)
!49 = !DILocation(line: 40, column: 9, scope: !38)
!50 = !DILocation(line: 41, column: 20, scope: !38)
!51 = !DILocation(line: 41, column: 9, scope: !38)
!52 = !DILocation(line: 42, column: 14, scope: !38)
!53 = !DILocation(line: 42, column: 9, scope: !38)
!54 = !DILocation(line: 44, column: 1, scope: !16)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_16_good", scope: !17, file: !17, line: 74, type: !18, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 76, column: 5, scope: !55)
!57 = !DILocation(line: 77, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 89, type: !59, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !17, line: 89, type: !7)
!65 = !DILocation(line: 89, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !17, line: 89, type: !61)
!67 = !DILocation(line: 89, column: 27, scope: !58)
!68 = !DILocation(line: 92, column: 22, scope: !58)
!69 = !DILocation(line: 92, column: 12, scope: !58)
!70 = !DILocation(line: 92, column: 5, scope: !58)
!71 = !DILocation(line: 94, column: 5, scope: !58)
!72 = !DILocation(line: 95, column: 5, scope: !58)
!73 = !DILocation(line: 96, column: 5, scope: !58)
!74 = !DILocation(line: 99, column: 5, scope: !58)
!75 = !DILocation(line: 100, column: 5, scope: !58)
!76 = !DILocation(line: 101, column: 5, scope: !58)
!77 = !DILocation(line: 103, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 51, type: !18, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !17, line: 53, type: !4)
!80 = !DILocation(line: 53, column: 15, scope: !78)
!81 = !DILocation(line: 54, column: 10, scope: !78)
!82 = !DILocation(line: 55, column: 5, scope: !78)
!83 = !DILocation(line: 58, column: 27, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !17, line: 56, column: 5)
!85 = !DILocation(line: 58, column: 16, scope: !84)
!86 = !DILocation(line: 58, column: 14, scope: !84)
!87 = !DILocation(line: 59, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !17, line: 59, column: 13)
!89 = !DILocation(line: 59, column: 18, scope: !88)
!90 = !DILocation(line: 59, column: 13, scope: !84)
!91 = !DILocation(line: 59, column: 28, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !17, line: 59, column: 27)
!93 = !DILocation(line: 60, column: 9, scope: !84)
!94 = !DILocation(line: 60, column: 17, scope: !84)
!95 = !DILocation(line: 61, column: 9, scope: !84)
!96 = !DILocalVariable(name: "source", scope: !97, file: !17, line: 64, type: !39)
!97 = distinct !DILexicalBlock(scope: !78, file: !17, line: 63, column: 5)
!98 = !DILocation(line: 64, column: 17, scope: !97)
!99 = !DILocation(line: 65, column: 17, scope: !97)
!100 = !DILocation(line: 65, column: 9, scope: !97)
!101 = !DILocation(line: 66, column: 9, scope: !97)
!102 = !DILocation(line: 66, column: 23, scope: !97)
!103 = !DILocation(line: 68, column: 16, scope: !97)
!104 = !DILocation(line: 68, column: 22, scope: !97)
!105 = !DILocation(line: 68, column: 9, scope: !97)
!106 = !DILocation(line: 69, column: 20, scope: !97)
!107 = !DILocation(line: 69, column: 9, scope: !97)
!108 = !DILocation(line: 70, column: 14, scope: !97)
!109 = !DILocation(line: 70, column: 9, scope: !97)
!110 = !DILocation(line: 72, column: 1, scope: !78)
