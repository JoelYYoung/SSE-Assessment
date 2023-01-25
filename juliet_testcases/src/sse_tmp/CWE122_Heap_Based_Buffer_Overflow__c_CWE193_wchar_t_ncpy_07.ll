; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_07_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end3, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !30
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %data, align 8, !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %cmp1 = icmp eq i32* %2, null, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !40

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_07_bad.source to i8*), i64 44, i1 false), !dbg !46
  %4 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !48
  %arraydecay4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %call5 = call i64 @wcslen(i32* %arraydecay4) #9, !dbg !50
  %add = add i64 %call5, 1, !dbg !51
  %call6 = call i32* @wcsncpy(i32* %4, i32* %arraydecay, i64 %add) #7, !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %5), !dbg !54
  %6 = load i32*, i32** %data, align 8, !dbg !55
  %7 = bitcast i32* %6 to i8*, !dbg !55
  call void @free(i8* %7) #7, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_07_good() #0 !dbg !58 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_07_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_07_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  %0 = load i32, i32* @staticFive, align 4, !dbg !86
  %cmp = icmp ne i32 %0, 5, !dbg !88
  br i1 %cmp, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end3, !dbg !92

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !93
  %1 = bitcast i8* %call to i32*, !dbg !95
  store i32* %1, i32** %data, align 8, !dbg !96
  %2 = load i32*, i32** %data, align 8, !dbg !97
  %cmp1 = icmp eq i32* %2, null, !dbg !99
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !100

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !105
  %4 = load i32*, i32** %data, align 8, !dbg !106
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !107
  %arraydecay4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !108
  %call5 = call i64 @wcslen(i32* %arraydecay4) #9, !dbg !109
  %add = add i64 %call5, 1, !dbg !110
  %call6 = call i32* @wcsncpy(i32* %4, i32* %arraydecay, i64 %add) #7, !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* %5), !dbg !113
  %6 = load i32*, i32** %data, align 8, !dbg !114
  %7 = bitcast i32* %6 to i8*, !dbg !114
  call void @free(i8* %7) #7, !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i32* null, i32** %data, align 8, !dbg !120
  %0 = load i32, i32* @staticFive, align 4, !dbg !121
  %cmp = icmp eq i32 %0, 5, !dbg !123
  br i1 %cmp, label %if.then, label %if.end3, !dbg !124

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !125
  %1 = bitcast i8* %call to i32*, !dbg !127
  store i32* %1, i32** %data, align 8, !dbg !128
  %2 = load i32*, i32** %data, align 8, !dbg !129
  %cmp1 = icmp eq i32* %2, null, !dbg !131
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !132

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !133
  unreachable, !dbg !133

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !135

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !138
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !138
  %4 = load i32*, i32** %data, align 8, !dbg !139
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !140
  %arraydecay4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !141
  %call5 = call i64 @wcslen(i32* %arraydecay4) #9, !dbg !142
  %add = add i64 %call5, 1, !dbg !143
  %call6 = call i32* @wcsncpy(i32* %4, i32* %arraydecay, i64 %add) #7, !dbg !144
  %5 = load i32*, i32** %data, align 8, !dbg !145
  call void @printWLine(i32* %5), !dbg !146
  %6 = load i32*, i32** %data, align 8, !dbg !147
  %7 = bitcast i32* %6 to i8*, !dbg !147
  call void @free(i8* %7) #7, !dbg !148
  ret void, !dbg !149
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_07_bad", scope: !13, file: !13, line: 34, type: !21, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 36, type: !6)
!24 = !DILocation(line: 36, column: 15, scope: !20)
!25 = !DILocation(line: 37, column: 10, scope: !20)
!26 = !DILocation(line: 38, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 38, column: 8)
!28 = !DILocation(line: 38, column: 18, scope: !27)
!29 = !DILocation(line: 38, column: 8, scope: !20)
!30 = !DILocation(line: 41, column: 27, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 39, column: 5)
!32 = !DILocation(line: 41, column: 16, scope: !31)
!33 = !DILocation(line: 41, column: 14, scope: !31)
!34 = !DILocation(line: 42, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 42, column: 13)
!36 = !DILocation(line: 42, column: 18, scope: !35)
!37 = !DILocation(line: 42, column: 13, scope: !31)
!38 = !DILocation(line: 42, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 42, column: 27)
!40 = !DILocation(line: 43, column: 5, scope: !31)
!41 = !DILocalVariable(name: "source", scope: !42, file: !13, line: 45, type: !43)
!42 = distinct !DILexicalBlock(scope: !20, file: !13, line: 44, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 11)
!46 = !DILocation(line: 45, column: 17, scope: !42)
!47 = !DILocation(line: 48, column: 17, scope: !42)
!48 = !DILocation(line: 48, column: 23, scope: !42)
!49 = !DILocation(line: 48, column: 38, scope: !42)
!50 = !DILocation(line: 48, column: 31, scope: !42)
!51 = !DILocation(line: 48, column: 46, scope: !42)
!52 = !DILocation(line: 48, column: 9, scope: !42)
!53 = !DILocation(line: 49, column: 20, scope: !42)
!54 = !DILocation(line: 49, column: 9, scope: !42)
!55 = !DILocation(line: 50, column: 14, scope: !42)
!56 = !DILocation(line: 50, column: 9, scope: !42)
!57 = !DILocation(line: 52, column: 1, scope: !20)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_07_good", scope: !13, file: !13, line: 105, type: !21, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 107, column: 5, scope: !58)
!60 = !DILocation(line: 108, column: 5, scope: !58)
!61 = !DILocation(line: 109, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 121, type: !63, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!9, !9, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !13, line: 121, type: !9)
!69 = !DILocation(line: 121, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !13, line: 121, type: !65)
!71 = !DILocation(line: 121, column: 27, scope: !62)
!72 = !DILocation(line: 124, column: 22, scope: !62)
!73 = !DILocation(line: 124, column: 12, scope: !62)
!74 = !DILocation(line: 124, column: 5, scope: !62)
!75 = !DILocation(line: 126, column: 5, scope: !62)
!76 = !DILocation(line: 127, column: 5, scope: !62)
!77 = !DILocation(line: 128, column: 5, scope: !62)
!78 = !DILocation(line: 131, column: 5, scope: !62)
!79 = !DILocation(line: 132, column: 5, scope: !62)
!80 = !DILocation(line: 133, column: 5, scope: !62)
!81 = !DILocation(line: 135, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 59, type: !21, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocalVariable(name: "data", scope: !82, file: !13, line: 61, type: !6)
!84 = !DILocation(line: 61, column: 15, scope: !82)
!85 = !DILocation(line: 62, column: 10, scope: !82)
!86 = !DILocation(line: 63, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !13, line: 63, column: 8)
!88 = !DILocation(line: 63, column: 18, scope: !87)
!89 = !DILocation(line: 63, column: 8, scope: !82)
!90 = !DILocation(line: 66, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !13, line: 64, column: 5)
!92 = !DILocation(line: 67, column: 5, scope: !91)
!93 = !DILocation(line: 71, column: 27, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !13, line: 69, column: 5)
!95 = !DILocation(line: 71, column: 16, scope: !94)
!96 = !DILocation(line: 71, column: 14, scope: !94)
!97 = !DILocation(line: 72, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !13, line: 72, column: 13)
!99 = !DILocation(line: 72, column: 18, scope: !98)
!100 = !DILocation(line: 72, column: 13, scope: !94)
!101 = !DILocation(line: 72, column: 28, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !13, line: 72, column: 27)
!103 = !DILocalVariable(name: "source", scope: !104, file: !13, line: 75, type: !43)
!104 = distinct !DILexicalBlock(scope: !82, file: !13, line: 74, column: 5)
!105 = !DILocation(line: 75, column: 17, scope: !104)
!106 = !DILocation(line: 78, column: 17, scope: !104)
!107 = !DILocation(line: 78, column: 23, scope: !104)
!108 = !DILocation(line: 78, column: 38, scope: !104)
!109 = !DILocation(line: 78, column: 31, scope: !104)
!110 = !DILocation(line: 78, column: 46, scope: !104)
!111 = !DILocation(line: 78, column: 9, scope: !104)
!112 = !DILocation(line: 79, column: 20, scope: !104)
!113 = !DILocation(line: 79, column: 9, scope: !104)
!114 = !DILocation(line: 80, column: 14, scope: !104)
!115 = !DILocation(line: 80, column: 9, scope: !104)
!116 = !DILocation(line: 82, column: 1, scope: !82)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 85, type: !21, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DILocalVariable(name: "data", scope: !117, file: !13, line: 87, type: !6)
!119 = !DILocation(line: 87, column: 15, scope: !117)
!120 = !DILocation(line: 88, column: 10, scope: !117)
!121 = !DILocation(line: 89, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !13, line: 89, column: 8)
!123 = !DILocation(line: 89, column: 18, scope: !122)
!124 = !DILocation(line: 89, column: 8, scope: !117)
!125 = !DILocation(line: 92, column: 27, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !13, line: 90, column: 5)
!127 = !DILocation(line: 92, column: 16, scope: !126)
!128 = !DILocation(line: 92, column: 14, scope: !126)
!129 = !DILocation(line: 93, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !13, line: 93, column: 13)
!131 = !DILocation(line: 93, column: 18, scope: !130)
!132 = !DILocation(line: 93, column: 13, scope: !126)
!133 = !DILocation(line: 93, column: 28, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !13, line: 93, column: 27)
!135 = !DILocation(line: 94, column: 5, scope: !126)
!136 = !DILocalVariable(name: "source", scope: !137, file: !13, line: 96, type: !43)
!137 = distinct !DILexicalBlock(scope: !117, file: !13, line: 95, column: 5)
!138 = !DILocation(line: 96, column: 17, scope: !137)
!139 = !DILocation(line: 99, column: 17, scope: !137)
!140 = !DILocation(line: 99, column: 23, scope: !137)
!141 = !DILocation(line: 99, column: 38, scope: !137)
!142 = !DILocation(line: 99, column: 31, scope: !137)
!143 = !DILocation(line: 99, column: 46, scope: !137)
!144 = !DILocation(line: 99, column: 9, scope: !137)
!145 = !DILocation(line: 100, column: 20, scope: !137)
!146 = !DILocation(line: 100, column: 9, scope: !137)
!147 = !DILocation(line: 101, column: 14, scope: !137)
!148 = !DILocation(line: 101, column: 9, scope: !137)
!149 = !DILocation(line: 103, column: 1, scope: !117)
