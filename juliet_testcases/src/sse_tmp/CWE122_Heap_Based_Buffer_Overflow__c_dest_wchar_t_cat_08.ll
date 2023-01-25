; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 @staticReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end3, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !46
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx5, align 4, !dbg !48
  %3 = load i32*, i32** %data, align 8, !dbg !49
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call7 = call i32* @wcscat(i32* %3, i32* %arraydecay6) #5, !dbg !51
  %4 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %4), !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %6 = bitcast i32* %5 to i8*, !dbg !54
  call void @free(i8* %6) #5, !dbg !55
  ret void, !dbg !56
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
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_08_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_08_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_08_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !81 {
entry:
  ret i32 1, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  %call = call i32 @staticReturnsFalse(), !dbg !89
  %tobool = icmp ne i32 %call, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end3, !dbg !94

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !95
  %0 = bitcast i8* %call1 to i32*, !dbg !97
  store i32* %0, i32** %data, align 8, !dbg !98
  %1 = load i32*, i32** %data, align 8, !dbg !99
  %cmp = icmp eq i32* %1, null, !dbg !101
  br i1 %cmp, label %if.then2, label %if.end, !dbg !102

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !111
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx5, align 4, !dbg !113
  %3 = load i32*, i32** %data, align 8, !dbg !114
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %call7 = call i32* @wcscat(i32* %3, i32* %arraydecay6) #5, !dbg !116
  %4 = load i32*, i32** %data, align 8, !dbg !117
  call void @printWLine(i32* %4), !dbg !118
  %5 = load i32*, i32** %data, align 8, !dbg !119
  %6 = bitcast i32* %5 to i8*, !dbg !119
  call void @free(i8* %6) #5, !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !122 {
entry:
  ret i32 0, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !124 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i32* null, i32** %data, align 8, !dbg !127
  %call = call i32 @staticReturnsTrue(), !dbg !128
  %tobool = icmp ne i32 %call, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.end3, !dbg !130

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !131
  %0 = bitcast i8* %call1 to i32*, !dbg !133
  store i32* %0, i32** %data, align 8, !dbg !134
  %1 = load i32*, i32** %data, align 8, !dbg !135
  %cmp = icmp eq i32* %1, null, !dbg !137
  br i1 %cmp, label %if.then2, label %if.end, !dbg !138

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !139
  unreachable, !dbg !139

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !141
  store i32 0, i32* %arrayidx, align 4, !dbg !142
  br label %if.end3, !dbg !143

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !144, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !147
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !148
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !149
  store i32 0, i32* %arrayidx5, align 4, !dbg !150
  %3 = load i32*, i32** %data, align 8, !dbg !151
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !152
  %call7 = call i32* @wcscat(i32* %3, i32* %arraydecay6) #5, !dbg !153
  %4 = load i32*, i32** %data, align 8, !dbg !154
  call void @printWLine(i32* %4), !dbg !155
  %5 = load i32*, i32** %data, align 8, !dbg !156
  %6 = bitcast i32* %5 to i8*, !dbg !156
  call void @free(i8* %6) #5, !dbg !157
  ret void, !dbg !158
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_08.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocation(line: 40, column: 10, scope: !16)
!23 = !DILocation(line: 41, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 8)
!25 = !DILocation(line: 41, column: 8, scope: !16)
!26 = !DILocation(line: 44, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 42, column: 5)
!28 = !DILocation(line: 44, column: 16, scope: !27)
!29 = !DILocation(line: 44, column: 14, scope: !27)
!30 = !DILocation(line: 45, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 45, column: 13)
!32 = !DILocation(line: 45, column: 18, scope: !31)
!33 = !DILocation(line: 45, column: 13, scope: !27)
!34 = !DILocation(line: 45, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 45, column: 27)
!36 = !DILocation(line: 46, column: 9, scope: !27)
!37 = !DILocation(line: 46, column: 17, scope: !27)
!38 = !DILocation(line: 47, column: 5, scope: !27)
!39 = !DILocalVariable(name: "source", scope: !40, file: !17, line: 49, type: !41)
!40 = distinct !DILexicalBlock(scope: !16, file: !17, line: 48, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 49, column: 17, scope: !40)
!45 = !DILocation(line: 50, column: 17, scope: !40)
!46 = !DILocation(line: 50, column: 9, scope: !40)
!47 = !DILocation(line: 51, column: 9, scope: !40)
!48 = !DILocation(line: 51, column: 23, scope: !40)
!49 = !DILocation(line: 53, column: 16, scope: !40)
!50 = !DILocation(line: 53, column: 22, scope: !40)
!51 = !DILocation(line: 53, column: 9, scope: !40)
!52 = !DILocation(line: 54, column: 20, scope: !40)
!53 = !DILocation(line: 54, column: 9, scope: !40)
!54 = !DILocation(line: 55, column: 14, scope: !40)
!55 = !DILocation(line: 55, column: 9, scope: !40)
!56 = !DILocation(line: 57, column: 1, scope: !16)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_08_good", scope: !17, file: !17, line: 114, type: !18, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 116, column: 5, scope: !57)
!59 = !DILocation(line: 117, column: 5, scope: !57)
!60 = !DILocation(line: 118, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 130, type: !62, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!7, !7, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !17, line: 130, type: !7)
!68 = !DILocation(line: 130, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !17, line: 130, type: !64)
!70 = !DILocation(line: 130, column: 27, scope: !61)
!71 = !DILocation(line: 133, column: 22, scope: !61)
!72 = !DILocation(line: 133, column: 12, scope: !61)
!73 = !DILocation(line: 133, column: 5, scope: !61)
!74 = !DILocation(line: 135, column: 5, scope: !61)
!75 = !DILocation(line: 136, column: 5, scope: !61)
!76 = !DILocation(line: 137, column: 5, scope: !61)
!77 = !DILocation(line: 140, column: 5, scope: !61)
!78 = !DILocation(line: 141, column: 5, scope: !61)
!79 = !DILocation(line: 142, column: 5, scope: !61)
!80 = !DILocation(line: 144, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !82, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!7}
!84 = !DILocation(line: 27, column: 5, scope: !81)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 64, type: !18, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !17, line: 66, type: !4)
!87 = !DILocation(line: 66, column: 15, scope: !85)
!88 = !DILocation(line: 67, column: 10, scope: !85)
!89 = !DILocation(line: 68, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !17, line: 68, column: 8)
!91 = !DILocation(line: 68, column: 8, scope: !85)
!92 = !DILocation(line: 71, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !17, line: 69, column: 5)
!94 = !DILocation(line: 72, column: 5, scope: !93)
!95 = !DILocation(line: 76, column: 27, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !17, line: 74, column: 5)
!97 = !DILocation(line: 76, column: 16, scope: !96)
!98 = !DILocation(line: 76, column: 14, scope: !96)
!99 = !DILocation(line: 77, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !17, line: 77, column: 13)
!101 = !DILocation(line: 77, column: 18, scope: !100)
!102 = !DILocation(line: 77, column: 13, scope: !96)
!103 = !DILocation(line: 77, column: 28, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !17, line: 77, column: 27)
!105 = !DILocation(line: 78, column: 9, scope: !96)
!106 = !DILocation(line: 78, column: 17, scope: !96)
!107 = !DILocalVariable(name: "source", scope: !108, file: !17, line: 81, type: !41)
!108 = distinct !DILexicalBlock(scope: !85, file: !17, line: 80, column: 5)
!109 = !DILocation(line: 81, column: 17, scope: !108)
!110 = !DILocation(line: 82, column: 17, scope: !108)
!111 = !DILocation(line: 82, column: 9, scope: !108)
!112 = !DILocation(line: 83, column: 9, scope: !108)
!113 = !DILocation(line: 83, column: 23, scope: !108)
!114 = !DILocation(line: 85, column: 16, scope: !108)
!115 = !DILocation(line: 85, column: 22, scope: !108)
!116 = !DILocation(line: 85, column: 9, scope: !108)
!117 = !DILocation(line: 86, column: 20, scope: !108)
!118 = !DILocation(line: 86, column: 9, scope: !108)
!119 = !DILocation(line: 87, column: 14, scope: !108)
!120 = !DILocation(line: 87, column: 9, scope: !108)
!121 = !DILocation(line: 89, column: 1, scope: !85)
!122 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !82, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocation(line: 32, column: 5, scope: !122)
!124 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 92, type: !18, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !17, line: 94, type: !4)
!126 = !DILocation(line: 94, column: 15, scope: !124)
!127 = !DILocation(line: 95, column: 10, scope: !124)
!128 = !DILocation(line: 96, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !17, line: 96, column: 8)
!130 = !DILocation(line: 96, column: 8, scope: !124)
!131 = !DILocation(line: 99, column: 27, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !17, line: 97, column: 5)
!133 = !DILocation(line: 99, column: 16, scope: !132)
!134 = !DILocation(line: 99, column: 14, scope: !132)
!135 = !DILocation(line: 100, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !17, line: 100, column: 13)
!137 = !DILocation(line: 100, column: 18, scope: !136)
!138 = !DILocation(line: 100, column: 13, scope: !132)
!139 = !DILocation(line: 100, column: 28, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !17, line: 100, column: 27)
!141 = !DILocation(line: 101, column: 9, scope: !132)
!142 = !DILocation(line: 101, column: 17, scope: !132)
!143 = !DILocation(line: 102, column: 5, scope: !132)
!144 = !DILocalVariable(name: "source", scope: !145, file: !17, line: 104, type: !41)
!145 = distinct !DILexicalBlock(scope: !124, file: !17, line: 103, column: 5)
!146 = !DILocation(line: 104, column: 17, scope: !145)
!147 = !DILocation(line: 105, column: 17, scope: !145)
!148 = !DILocation(line: 105, column: 9, scope: !145)
!149 = !DILocation(line: 106, column: 9, scope: !145)
!150 = !DILocation(line: 106, column: 23, scope: !145)
!151 = !DILocation(line: 108, column: 16, scope: !145)
!152 = !DILocation(line: 108, column: 22, scope: !145)
!153 = !DILocation(line: 108, column: 9, scope: !145)
!154 = !DILocation(line: 109, column: 20, scope: !145)
!155 = !DILocation(line: 109, column: 9, scope: !145)
!156 = !DILocation(line: 110, column: 14, scope: !145)
!157 = !DILocation(line: 110, column: 9, scope: !145)
!158 = !DILocation(line: 112, column: 1, scope: !124)
