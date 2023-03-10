; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call1, 0, !dbg !31
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !33

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end4, !dbg !39

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !48
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !49
  %call6 = call i32* @wcsncat(i32* %arraydecay, i32* %5, i64 %call5) #7, !dbg !50
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !51
  store i32 0, i32* %arrayidx7, align 4, !dbg !52
  %7 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %7), !dbg !54
  %8 = load i32*, i32** %data, align 8, !dbg !55
  %9 = bitcast i32* %8 to i8*, !dbg !55
  call void @free(i8* %9) #7, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcsncat(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_08_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_08_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_08_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !82 {
entry:
  ret i32 1, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !89
  %0 = bitcast i8* %call to i32*, !dbg !90
  store i32* %0, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !98
  %tobool = icmp ne i32 %call1, 0, !dbg !98
  br i1 %tobool, label %if.then2, label %if.else, !dbg !100

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !101
  br label %if.end4, !dbg !103

if.else:                                          ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !104
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !106
  %3 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !111
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !112
  %5 = load i32*, i32** %data, align 8, !dbg !113
  %6 = load i32*, i32** %data, align 8, !dbg !114
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !115
  %call6 = call i32* @wcsncat(i32* %arraydecay, i32* %5, i64 %call5) #7, !dbg !116
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !117
  store i32 0, i32* %arrayidx7, align 4, !dbg !118
  %7 = load i32*, i32** %data, align 8, !dbg !119
  call void @printWLine(i32* %7), !dbg !120
  %8 = load i32*, i32** %data, align 8, !dbg !121
  %9 = bitcast i32* %8 to i8*, !dbg !121
  call void @free(i8* %9) #7, !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !124 {
entry:
  ret i32 0, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !126 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !127, metadata !DIExpression()), !dbg !128
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !129
  %0 = bitcast i8* %call to i32*, !dbg !130
  store i32* %0, i32** %data, align 8, !dbg !131
  %1 = load i32*, i32** %data, align 8, !dbg !132
  %cmp = icmp eq i32* %1, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !138
  %tobool = icmp ne i32 %call1, 0, !dbg !138
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !140

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !141
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !143
  %3 = load i32*, i32** %data, align 8, !dbg !144
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !144
  store i32 0, i32* %arrayidx, align 4, !dbg !145
  br label %if.end4, !dbg !146

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !147, metadata !DIExpression()), !dbg !149
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !149
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !150
  %5 = load i32*, i32** %data, align 8, !dbg !151
  %6 = load i32*, i32** %data, align 8, !dbg !152
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !153
  %call6 = call i32* @wcsncat(i32* %arraydecay, i32* %5, i64 %call5) #7, !dbg !154
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !155
  store i32 0, i32* %arrayidx7, align 4, !dbg !156
  %7 = load i32*, i32** %data, align 8, !dbg !157
  call void @printWLine(i32* %7), !dbg !158
  %8 = load i32*, i32** %data, align 8, !dbg !159
  %9 = bitcast i32* %8 to i8*, !dbg !159
  call void @free(i8* %9) #7, !dbg !160
  ret void, !dbg !161
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_08.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocation(line: 40, column: 23, scope: !16)
!23 = !DILocation(line: 40, column: 12, scope: !16)
!24 = !DILocation(line: 40, column: 10, scope: !16)
!25 = !DILocation(line: 41, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 9)
!27 = !DILocation(line: 41, column: 14, scope: !26)
!28 = !DILocation(line: 41, column: 9, scope: !16)
!29 = !DILocation(line: 41, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 41, column: 23)
!31 = !DILocation(line: 42, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 42, column: 8)
!33 = !DILocation(line: 42, column: 8, scope: !16)
!34 = !DILocation(line: 45, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !17, line: 43, column: 5)
!36 = !DILocation(line: 45, column: 9, scope: !35)
!37 = !DILocation(line: 46, column: 9, scope: !35)
!38 = !DILocation(line: 46, column: 21, scope: !35)
!39 = !DILocation(line: 47, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !17, line: 49, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !17, line: 48, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 49, column: 17, scope: !41)
!46 = !DILocation(line: 51, column: 17, scope: !41)
!47 = !DILocation(line: 51, column: 23, scope: !41)
!48 = !DILocation(line: 51, column: 36, scope: !41)
!49 = !DILocation(line: 51, column: 29, scope: !41)
!50 = !DILocation(line: 51, column: 9, scope: !41)
!51 = !DILocation(line: 52, column: 9, scope: !41)
!52 = !DILocation(line: 52, column: 20, scope: !41)
!53 = !DILocation(line: 53, column: 20, scope: !41)
!54 = !DILocation(line: 53, column: 9, scope: !41)
!55 = !DILocation(line: 54, column: 14, scope: !41)
!56 = !DILocation(line: 54, column: 9, scope: !41)
!57 = !DILocation(line: 56, column: 1, scope: !16)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_08_good", scope: !17, file: !17, line: 111, type: !18, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 113, column: 5, scope: !58)
!60 = !DILocation(line: 114, column: 5, scope: !58)
!61 = !DILocation(line: 115, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 127, type: !63, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!7, !7, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !17, line: 127, type: !7)
!69 = !DILocation(line: 127, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !17, line: 127, type: !65)
!71 = !DILocation(line: 127, column: 27, scope: !62)
!72 = !DILocation(line: 130, column: 22, scope: !62)
!73 = !DILocation(line: 130, column: 12, scope: !62)
!74 = !DILocation(line: 130, column: 5, scope: !62)
!75 = !DILocation(line: 132, column: 5, scope: !62)
!76 = !DILocation(line: 133, column: 5, scope: !62)
!77 = !DILocation(line: 134, column: 5, scope: !62)
!78 = !DILocation(line: 137, column: 5, scope: !62)
!79 = !DILocation(line: 138, column: 5, scope: !62)
!80 = !DILocation(line: 139, column: 5, scope: !62)
!81 = !DILocation(line: 141, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !83, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!7}
!85 = !DILocation(line: 27, column: 5, scope: !82)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 63, type: !18, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !17, line: 65, type: !4)
!88 = !DILocation(line: 65, column: 15, scope: !86)
!89 = !DILocation(line: 66, column: 23, scope: !86)
!90 = !DILocation(line: 66, column: 12, scope: !86)
!91 = !DILocation(line: 66, column: 10, scope: !86)
!92 = !DILocation(line: 67, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !17, line: 67, column: 9)
!94 = !DILocation(line: 67, column: 14, scope: !93)
!95 = !DILocation(line: 67, column: 9, scope: !86)
!96 = !DILocation(line: 67, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !17, line: 67, column: 23)
!98 = !DILocation(line: 68, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !86, file: !17, line: 68, column: 8)
!100 = !DILocation(line: 68, column: 8, scope: !86)
!101 = !DILocation(line: 71, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !17, line: 69, column: 5)
!103 = !DILocation(line: 72, column: 5, scope: !102)
!104 = !DILocation(line: 76, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !17, line: 74, column: 5)
!106 = !DILocation(line: 76, column: 9, scope: !105)
!107 = !DILocation(line: 77, column: 9, scope: !105)
!108 = !DILocation(line: 77, column: 20, scope: !105)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !17, line: 80, type: !42)
!110 = distinct !DILexicalBlock(scope: !86, file: !17, line: 79, column: 5)
!111 = !DILocation(line: 80, column: 17, scope: !110)
!112 = !DILocation(line: 82, column: 17, scope: !110)
!113 = !DILocation(line: 82, column: 23, scope: !110)
!114 = !DILocation(line: 82, column: 36, scope: !110)
!115 = !DILocation(line: 82, column: 29, scope: !110)
!116 = !DILocation(line: 82, column: 9, scope: !110)
!117 = !DILocation(line: 83, column: 9, scope: !110)
!118 = !DILocation(line: 83, column: 20, scope: !110)
!119 = !DILocation(line: 84, column: 20, scope: !110)
!120 = !DILocation(line: 84, column: 9, scope: !110)
!121 = !DILocation(line: 85, column: 14, scope: !110)
!122 = !DILocation(line: 85, column: 9, scope: !110)
!123 = !DILocation(line: 87, column: 1, scope: !86)
!124 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !83, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocation(line: 32, column: 5, scope: !124)
!126 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 90, type: !18, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocalVariable(name: "data", scope: !126, file: !17, line: 92, type: !4)
!128 = !DILocation(line: 92, column: 15, scope: !126)
!129 = !DILocation(line: 93, column: 23, scope: !126)
!130 = !DILocation(line: 93, column: 12, scope: !126)
!131 = !DILocation(line: 93, column: 10, scope: !126)
!132 = !DILocation(line: 94, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !126, file: !17, line: 94, column: 9)
!134 = !DILocation(line: 94, column: 14, scope: !133)
!135 = !DILocation(line: 94, column: 9, scope: !126)
!136 = !DILocation(line: 94, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !17, line: 94, column: 23)
!138 = !DILocation(line: 95, column: 8, scope: !139)
!139 = distinct !DILexicalBlock(scope: !126, file: !17, line: 95, column: 8)
!140 = !DILocation(line: 95, column: 8, scope: !126)
!141 = !DILocation(line: 98, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !17, line: 96, column: 5)
!143 = !DILocation(line: 98, column: 9, scope: !142)
!144 = !DILocation(line: 99, column: 9, scope: !142)
!145 = !DILocation(line: 99, column: 20, scope: !142)
!146 = !DILocation(line: 100, column: 5, scope: !142)
!147 = !DILocalVariable(name: "dest", scope: !148, file: !17, line: 102, type: !42)
!148 = distinct !DILexicalBlock(scope: !126, file: !17, line: 101, column: 5)
!149 = !DILocation(line: 102, column: 17, scope: !148)
!150 = !DILocation(line: 104, column: 17, scope: !148)
!151 = !DILocation(line: 104, column: 23, scope: !148)
!152 = !DILocation(line: 104, column: 36, scope: !148)
!153 = !DILocation(line: 104, column: 29, scope: !148)
!154 = !DILocation(line: 104, column: 9, scope: !148)
!155 = !DILocation(line: 105, column: 9, scope: !148)
!156 = !DILocation(line: 105, column: 20, scope: !148)
!157 = !DILocation(line: 106, column: 20, scope: !148)
!158 = !DILocation(line: 106, column: 9, scope: !148)
!159 = !DILocation(line: 107, column: 14, scope: !148)
!160 = !DILocation(line: 107, column: 9, scope: !148)
!161 = !DILocation(line: 109, column: 1, scope: !126)
