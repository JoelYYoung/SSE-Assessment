; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_08_bad() #0 !dbg !16 {
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
  %call7 = call i32* @wcsncpy(i32* %3, i32* %arraydecay6, i64 99) #5, !dbg !51
  %4 = load i32*, i32** %data, align 8, !dbg !52
  %arrayidx8 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !52
  store i32 0, i32* %arrayidx8, align 4, !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* %5), !dbg !55
  %6 = load i32*, i32** %data, align 8, !dbg !56
  %7 = bitcast i32* %6 to i8*, !dbg !56
  call void @free(i8* %7) #5, !dbg !57
  ret void, !dbg !58
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
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_08_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
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
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_08_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_08_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !83 {
entry:
  ret i32 1, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  %call = call i32 @staticReturnsFalse(), !dbg !91
  %tobool = icmp ne i32 %call, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end3, !dbg !96

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !97
  %0 = bitcast i8* %call1 to i32*, !dbg !99
  store i32* %0, i32** %data, align 8, !dbg !100
  %1 = load i32*, i32** %data, align 8, !dbg !101
  %cmp = icmp eq i32* %1, null, !dbg !103
  br i1 %cmp, label %if.then2, label %if.end, !dbg !104

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !113
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx5, align 4, !dbg !115
  %3 = load i32*, i32** %data, align 8, !dbg !116
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %call7 = call i32* @wcsncpy(i32* %3, i32* %arraydecay6, i64 99) #5, !dbg !118
  %4 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx8 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !119
  store i32 0, i32* %arrayidx8, align 4, !dbg !120
  %5 = load i32*, i32** %data, align 8, !dbg !121
  call void @printWLine(i32* %5), !dbg !122
  %6 = load i32*, i32** %data, align 8, !dbg !123
  %7 = bitcast i32* %6 to i8*, !dbg !123
  call void @free(i8* %7) #5, !dbg !124
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !126 {
entry:
  ret i32 0, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !128 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !129, metadata !DIExpression()), !dbg !130
  store i32* null, i32** %data, align 8, !dbg !131
  %call = call i32 @staticReturnsTrue(), !dbg !132
  %tobool = icmp ne i32 %call, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.end3, !dbg !134

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !135
  %0 = bitcast i8* %call1 to i32*, !dbg !137
  store i32* %0, i32** %data, align 8, !dbg !138
  %1 = load i32*, i32** %data, align 8, !dbg !139
  %cmp = icmp eq i32* %1, null, !dbg !141
  br i1 %cmp, label %if.then2, label %if.end, !dbg !142

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !145
  store i32 0, i32* %arrayidx, align 4, !dbg !146
  br label %if.end3, !dbg !147

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !148, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !151
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !152
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !153
  store i32 0, i32* %arrayidx5, align 4, !dbg !154
  %3 = load i32*, i32** %data, align 8, !dbg !155
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !156
  %call7 = call i32* @wcsncpy(i32* %3, i32* %arraydecay6, i64 99) #5, !dbg !157
  %4 = load i32*, i32** %data, align 8, !dbg !158
  %arrayidx8 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !158
  store i32 0, i32* %arrayidx8, align 4, !dbg !159
  %5 = load i32*, i32** %data, align 8, !dbg !160
  call void @printWLine(i32* %5), !dbg !161
  %6 = load i32*, i32** %data, align 8, !dbg !162
  %7 = bitcast i32* %6 to i8*, !dbg !162
  call void @free(i8* %7) #5, !dbg !163
  ret void, !dbg !164
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_08.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_08.c", directory: "/root/SSE-Assessment")
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
!49 = !DILocation(line: 53, column: 17, scope: !40)
!50 = !DILocation(line: 53, column: 23, scope: !40)
!51 = !DILocation(line: 53, column: 9, scope: !40)
!52 = !DILocation(line: 54, column: 9, scope: !40)
!53 = !DILocation(line: 54, column: 21, scope: !40)
!54 = !DILocation(line: 55, column: 20, scope: !40)
!55 = !DILocation(line: 55, column: 9, scope: !40)
!56 = !DILocation(line: 56, column: 14, scope: !40)
!57 = !DILocation(line: 56, column: 9, scope: !40)
!58 = !DILocation(line: 58, column: 1, scope: !16)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_08_good", scope: !17, file: !17, line: 117, type: !18, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 119, column: 5, scope: !59)
!61 = !DILocation(line: 120, column: 5, scope: !59)
!62 = !DILocation(line: 121, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 133, type: !64, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !17, line: 133, type: !7)
!70 = !DILocation(line: 133, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !17, line: 133, type: !66)
!72 = !DILocation(line: 133, column: 27, scope: !63)
!73 = !DILocation(line: 136, column: 22, scope: !63)
!74 = !DILocation(line: 136, column: 12, scope: !63)
!75 = !DILocation(line: 136, column: 5, scope: !63)
!76 = !DILocation(line: 138, column: 5, scope: !63)
!77 = !DILocation(line: 139, column: 5, scope: !63)
!78 = !DILocation(line: 140, column: 5, scope: !63)
!79 = !DILocation(line: 143, column: 5, scope: !63)
!80 = !DILocation(line: 144, column: 5, scope: !63)
!81 = !DILocation(line: 145, column: 5, scope: !63)
!82 = !DILocation(line: 147, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !84, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!7}
!86 = !DILocation(line: 27, column: 5, scope: !83)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 65, type: !18, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !17, line: 67, type: !4)
!89 = !DILocation(line: 67, column: 15, scope: !87)
!90 = !DILocation(line: 68, column: 10, scope: !87)
!91 = !DILocation(line: 69, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !17, line: 69, column: 8)
!93 = !DILocation(line: 69, column: 8, scope: !87)
!94 = !DILocation(line: 72, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !17, line: 70, column: 5)
!96 = !DILocation(line: 73, column: 5, scope: !95)
!97 = !DILocation(line: 77, column: 27, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !17, line: 75, column: 5)
!99 = !DILocation(line: 77, column: 16, scope: !98)
!100 = !DILocation(line: 77, column: 14, scope: !98)
!101 = !DILocation(line: 78, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !17, line: 78, column: 13)
!103 = !DILocation(line: 78, column: 18, scope: !102)
!104 = !DILocation(line: 78, column: 13, scope: !98)
!105 = !DILocation(line: 78, column: 28, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !17, line: 78, column: 27)
!107 = !DILocation(line: 79, column: 9, scope: !98)
!108 = !DILocation(line: 79, column: 17, scope: !98)
!109 = !DILocalVariable(name: "source", scope: !110, file: !17, line: 82, type: !41)
!110 = distinct !DILexicalBlock(scope: !87, file: !17, line: 81, column: 5)
!111 = !DILocation(line: 82, column: 17, scope: !110)
!112 = !DILocation(line: 83, column: 17, scope: !110)
!113 = !DILocation(line: 83, column: 9, scope: !110)
!114 = !DILocation(line: 84, column: 9, scope: !110)
!115 = !DILocation(line: 84, column: 23, scope: !110)
!116 = !DILocation(line: 86, column: 17, scope: !110)
!117 = !DILocation(line: 86, column: 23, scope: !110)
!118 = !DILocation(line: 86, column: 9, scope: !110)
!119 = !DILocation(line: 87, column: 9, scope: !110)
!120 = !DILocation(line: 87, column: 21, scope: !110)
!121 = !DILocation(line: 88, column: 20, scope: !110)
!122 = !DILocation(line: 88, column: 9, scope: !110)
!123 = !DILocation(line: 89, column: 14, scope: !110)
!124 = !DILocation(line: 89, column: 9, scope: !110)
!125 = !DILocation(line: 91, column: 1, scope: !87)
!126 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !84, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocation(line: 32, column: 5, scope: !126)
!128 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 94, type: !18, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocalVariable(name: "data", scope: !128, file: !17, line: 96, type: !4)
!130 = !DILocation(line: 96, column: 15, scope: !128)
!131 = !DILocation(line: 97, column: 10, scope: !128)
!132 = !DILocation(line: 98, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !17, line: 98, column: 8)
!134 = !DILocation(line: 98, column: 8, scope: !128)
!135 = !DILocation(line: 101, column: 27, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !17, line: 99, column: 5)
!137 = !DILocation(line: 101, column: 16, scope: !136)
!138 = !DILocation(line: 101, column: 14, scope: !136)
!139 = !DILocation(line: 102, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !17, line: 102, column: 13)
!141 = !DILocation(line: 102, column: 18, scope: !140)
!142 = !DILocation(line: 102, column: 13, scope: !136)
!143 = !DILocation(line: 102, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !17, line: 102, column: 27)
!145 = !DILocation(line: 103, column: 9, scope: !136)
!146 = !DILocation(line: 103, column: 17, scope: !136)
!147 = !DILocation(line: 104, column: 5, scope: !136)
!148 = !DILocalVariable(name: "source", scope: !149, file: !17, line: 106, type: !41)
!149 = distinct !DILexicalBlock(scope: !128, file: !17, line: 105, column: 5)
!150 = !DILocation(line: 106, column: 17, scope: !149)
!151 = !DILocation(line: 107, column: 17, scope: !149)
!152 = !DILocation(line: 107, column: 9, scope: !149)
!153 = !DILocation(line: 108, column: 9, scope: !149)
!154 = !DILocation(line: 108, column: 23, scope: !149)
!155 = !DILocation(line: 110, column: 17, scope: !149)
!156 = !DILocation(line: 110, column: 23, scope: !149)
!157 = !DILocation(line: 110, column: 9, scope: !149)
!158 = !DILocation(line: 111, column: 9, scope: !149)
!159 = !DILocation(line: 111, column: 21, scope: !149)
!160 = !DILocation(line: 112, column: 20, scope: !149)
!161 = !DILocation(line: 112, column: 9, scope: !149)
!162 = !DILocation(line: 113, column: 14, scope: !149)
!163 = !DILocation(line: 113, column: 9, scope: !149)
!164 = !DILocation(line: 115, column: 1, scope: !128)
