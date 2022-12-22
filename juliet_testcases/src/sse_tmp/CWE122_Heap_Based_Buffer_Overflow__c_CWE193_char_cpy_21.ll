; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_21_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  store i32 1, i32* @badStatic, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call = call i8* @badSource(i8* %0), !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_21_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !40
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* %3), !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  call void @free(i8* %4) #6, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !47 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %0 = load i32, i32* @badStatic, align 4, !dbg !52
  %tobool = icmp ne i32 %0, 0, !dbg !52
  br i1 %tobool, label %if.then, label %if.end2, !dbg !54

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !55
  store i8* %call, i8** %data.addr, align 8, !dbg !57
  %1 = load i8*, i8** %data.addr, align 8, !dbg !58
  %cmp = icmp eq i8* %1, null, !dbg !60
  br i1 %cmp, label %if.then1, label %if.end, !dbg !61

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !62
  unreachable, !dbg !62

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !64

if.end2:                                          ; preds = %if.end, %entry
  %2 = load i8*, i8** %data.addr, align 8, !dbg !65
  ret i8* %2, !dbg !66
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_21_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #6, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #6, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_21_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_21_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i8* null, i8** %data, align 8, !dbg !92
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !93
  %0 = load i8*, i8** %data, align 8, !dbg !94
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !95
  store i8* %call, i8** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !99
  %2 = load i8*, i8** %data, align 8, !dbg !100
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !101
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !102
  %3 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* %3), !dbg !104
  %4 = load i8*, i8** %data, align 8, !dbg !105
  call void @free(i8* %4) #6, !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !108 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !111
  %tobool = icmp ne i32 %0, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end2, !dbg !116

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !117
  store i8* %call, i8** %data.addr, align 8, !dbg !119
  %1 = load i8*, i8** %data.addr, align 8, !dbg !120
  %cmp = icmp eq i8* %1, null, !dbg !122
  br i1 %cmp, label %if.then1, label %if.end, !dbg !123

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !126
  ret i8* %2, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !128 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !129, metadata !DIExpression()), !dbg !130
  store i8* null, i8** %data, align 8, !dbg !131
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !132
  %0 = load i8*, i8** %data, align 8, !dbg !133
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !134
  store i8* %call, i8** %data, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !138
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !138
  %2 = load i8*, i8** %data, align 8, !dbg !139
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !140
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !141
  %3 = load i8*, i8** %data, align 8, !dbg !142
  call void @printLine(i8* %3), !dbg !143
  %4 = load i8*, i8** %data, align 8, !dbg !144
  call void @free(i8* %4) #6, !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !147 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !150
  %tobool = icmp ne i32 %0, 0, !dbg !150
  br i1 %tobool, label %if.then, label %if.end2, !dbg !152

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !153
  store i8* %call, i8** %data.addr, align 8, !dbg !155
  %1 = load i8*, i8** %data.addr, align 8, !dbg !156
  %cmp = icmp eq i8* %1, null, !dbg !158
  br i1 %cmp, label %if.then1, label %if.end, !dbg !159

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !160
  unreachable, !dbg !160

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !162

if.end2:                                          ; preds = %if.end, %entry
  %2 = load i8*, i8** %data.addr, align 8, !dbg !163
  ret i8* %2, !dbg !164
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 29, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 62, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_21.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 63, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_21_bad", scope: !13, file: !13, line: 42, type: !24, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 44, type: !7)
!27 = !DILocation(line: 44, column: 12, scope: !23)
!28 = !DILocation(line: 45, column: 10, scope: !23)
!29 = !DILocation(line: 46, column: 15, scope: !23)
!30 = !DILocation(line: 47, column: 22, scope: !23)
!31 = !DILocation(line: 47, column: 12, scope: !23)
!32 = !DILocation(line: 47, column: 10, scope: !23)
!33 = !DILocalVariable(name: "source", scope: !34, file: !13, line: 49, type: !35)
!34 = distinct !DILexicalBlock(scope: !23, file: !13, line: 48, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 88, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 49, column: 14, scope: !34)
!39 = !DILocation(line: 51, column: 16, scope: !34)
!40 = !DILocation(line: 51, column: 22, scope: !34)
!41 = !DILocation(line: 51, column: 9, scope: !34)
!42 = !DILocation(line: 52, column: 19, scope: !34)
!43 = !DILocation(line: 52, column: 9, scope: !34)
!44 = !DILocation(line: 53, column: 14, scope: !34)
!45 = !DILocation(line: 53, column: 9, scope: !34)
!46 = !DILocation(line: 55, column: 1, scope: !23)
!47 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 31, type: !48, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!7, !7}
!50 = !DILocalVariable(name: "data", arg: 1, scope: !47, file: !13, line: 31, type: !7)
!51 = !DILocation(line: 31, column: 32, scope: !47)
!52 = !DILocation(line: 33, column: 8, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !13, line: 33, column: 8)
!54 = !DILocation(line: 33, column: 8, scope: !47)
!55 = !DILocation(line: 36, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !13, line: 34, column: 5)
!57 = !DILocation(line: 36, column: 14, scope: !56)
!58 = !DILocation(line: 37, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !13, line: 37, column: 13)
!60 = !DILocation(line: 37, column: 18, scope: !59)
!61 = !DILocation(line: 37, column: 13, scope: !56)
!62 = !DILocation(line: 37, column: 28, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !13, line: 37, column: 27)
!64 = !DILocation(line: 38, column: 5, scope: !56)
!65 = !DILocation(line: 39, column: 12, scope: !47)
!66 = !DILocation(line: 39, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_21_good", scope: !13, file: !13, line: 124, type: !24, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocation(line: 126, column: 5, scope: !67)
!69 = !DILocation(line: 127, column: 5, scope: !67)
!70 = !DILocation(line: 128, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 140, type: !72, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!14, !14, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !13, line: 140, type: !14)
!76 = !DILocation(line: 140, column: 14, scope: !71)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !13, line: 140, type: !74)
!78 = !DILocation(line: 140, column: 27, scope: !71)
!79 = !DILocation(line: 143, column: 22, scope: !71)
!80 = !DILocation(line: 143, column: 12, scope: !71)
!81 = !DILocation(line: 143, column: 5, scope: !71)
!82 = !DILocation(line: 145, column: 5, scope: !71)
!83 = !DILocation(line: 146, column: 5, scope: !71)
!84 = !DILocation(line: 147, column: 5, scope: !71)
!85 = !DILocation(line: 150, column: 5, scope: !71)
!86 = !DILocation(line: 151, column: 5, scope: !71)
!87 = !DILocation(line: 152, column: 5, scope: !71)
!88 = !DILocation(line: 154, column: 5, scope: !71)
!89 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 82, type: !24, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocalVariable(name: "data", scope: !89, file: !13, line: 84, type: !7)
!91 = !DILocation(line: 84, column: 12, scope: !89)
!92 = !DILocation(line: 85, column: 10, scope: !89)
!93 = !DILocation(line: 86, column: 20, scope: !89)
!94 = !DILocation(line: 87, column: 27, scope: !89)
!95 = !DILocation(line: 87, column: 12, scope: !89)
!96 = !DILocation(line: 87, column: 10, scope: !89)
!97 = !DILocalVariable(name: "source", scope: !98, file: !13, line: 89, type: !35)
!98 = distinct !DILexicalBlock(scope: !89, file: !13, line: 88, column: 5)
!99 = !DILocation(line: 89, column: 14, scope: !98)
!100 = !DILocation(line: 91, column: 16, scope: !98)
!101 = !DILocation(line: 91, column: 22, scope: !98)
!102 = !DILocation(line: 91, column: 9, scope: !98)
!103 = !DILocation(line: 92, column: 19, scope: !98)
!104 = !DILocation(line: 92, column: 9, scope: !98)
!105 = !DILocation(line: 93, column: 14, scope: !98)
!106 = !DILocation(line: 93, column: 9, scope: !98)
!107 = !DILocation(line: 95, column: 1, scope: !89)
!108 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 66, type: !48, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", arg: 1, scope: !108, file: !13, line: 66, type: !7)
!110 = !DILocation(line: 66, column: 37, scope: !108)
!111 = !DILocation(line: 68, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !13, line: 68, column: 8)
!113 = !DILocation(line: 68, column: 8, scope: !108)
!114 = !DILocation(line: 71, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !13, line: 69, column: 5)
!116 = !DILocation(line: 72, column: 5, scope: !115)
!117 = !DILocation(line: 76, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !13, line: 74, column: 5)
!119 = !DILocation(line: 76, column: 14, scope: !118)
!120 = !DILocation(line: 77, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !13, line: 77, column: 13)
!122 = !DILocation(line: 77, column: 18, scope: !121)
!123 = !DILocation(line: 77, column: 13, scope: !118)
!124 = !DILocation(line: 77, column: 28, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !13, line: 77, column: 27)
!126 = !DILocation(line: 79, column: 12, scope: !108)
!127 = !DILocation(line: 79, column: 5, scope: !108)
!128 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 109, type: !24, scopeLine: 110, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!129 = !DILocalVariable(name: "data", scope: !128, file: !13, line: 111, type: !7)
!130 = !DILocation(line: 111, column: 12, scope: !128)
!131 = !DILocation(line: 112, column: 10, scope: !128)
!132 = !DILocation(line: 113, column: 20, scope: !128)
!133 = !DILocation(line: 114, column: 27, scope: !128)
!134 = !DILocation(line: 114, column: 12, scope: !128)
!135 = !DILocation(line: 114, column: 10, scope: !128)
!136 = !DILocalVariable(name: "source", scope: !137, file: !13, line: 116, type: !35)
!137 = distinct !DILexicalBlock(scope: !128, file: !13, line: 115, column: 5)
!138 = !DILocation(line: 116, column: 14, scope: !137)
!139 = !DILocation(line: 118, column: 16, scope: !137)
!140 = !DILocation(line: 118, column: 22, scope: !137)
!141 = !DILocation(line: 118, column: 9, scope: !137)
!142 = !DILocation(line: 119, column: 19, scope: !137)
!143 = !DILocation(line: 119, column: 9, scope: !137)
!144 = !DILocation(line: 120, column: 14, scope: !137)
!145 = !DILocation(line: 120, column: 9, scope: !137)
!146 = !DILocation(line: 122, column: 1, scope: !128)
!147 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 98, type: !48, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!148 = !DILocalVariable(name: "data", arg: 1, scope: !147, file: !13, line: 98, type: !7)
!149 = !DILocation(line: 98, column: 37, scope: !147)
!150 = !DILocation(line: 100, column: 8, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !13, line: 100, column: 8)
!152 = !DILocation(line: 100, column: 8, scope: !147)
!153 = !DILocation(line: 103, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !13, line: 101, column: 5)
!155 = !DILocation(line: 103, column: 14, scope: !154)
!156 = !DILocation(line: 104, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !13, line: 104, column: 13)
!158 = !DILocation(line: 104, column: 18, scope: !157)
!159 = !DILocation(line: 104, column: 13, scope: !154)
!160 = !DILocation(line: 104, column: 28, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 104, column: 27)
!162 = !DILocation(line: 105, column: 5, scope: !154)
!163 = !DILocation(line: 106, column: 12, scope: !147)
!164 = !DILocation(line: 106, column: 5, scope: !147)
