; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_21_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !13
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @badSource(i32* %0), !dbg !32
  store i32* %call, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_21_bad.source to i8*), i64 44, i1 false), !dbg !39
  %2 = load i32*, i32** %data, align 8, !dbg !40
  %3 = bitcast i32* %2 to i8*, !dbg !41
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !41
  %4 = bitcast i32* %arraydecay to i8*, !dbg !41
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !42
  %call2 = call i64 @wcslen(i32* %arraydecay1) #7, !dbg !43
  %add = add i64 %call2, 1, !dbg !44
  %mul = mul i64 %add, 4, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %5), !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !48
  %7 = bitcast i32* %6 to i8*, !dbg !48
  call void @free(i8* %7) #8, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !51 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %0 = load i32, i32* @badStatic, align 4, !dbg !56
  %tobool = icmp ne i32 %0, 0, !dbg !56
  br i1 %tobool, label %if.then, label %if.end2, !dbg !58

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !59
  %1 = bitcast i8* %call to i32*, !dbg !61
  store i32* %1, i32** %data.addr, align 8, !dbg !62
  %2 = load i32*, i32** %data.addr, align 8, !dbg !63
  %cmp = icmp eq i32* %2, null, !dbg !65
  br i1 %cmp, label %if.then1, label %if.end, !dbg !66

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !67
  unreachable, !dbg !67

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !69

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !70
  ret i32* %3, !dbg !71
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_21_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #8, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #8, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_21_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_21_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i32* null, i32** %data, align 8, !dbg !99
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !100
  %0 = load i32*, i32** %data, align 8, !dbg !101
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !102
  store i32* %call, i32** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !106
  %2 = load i32*, i32** %data, align 8, !dbg !107
  %3 = bitcast i32* %2 to i8*, !dbg !108
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !108
  %4 = bitcast i32* %arraydecay to i8*, !dbg !108
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !109
  %call2 = call i64 @wcslen(i32* %arraydecay1) #7, !dbg !110
  %add = add i64 %call2, 1, !dbg !111
  %mul = mul i64 %add, 4, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !108
  %5 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* %5), !dbg !114
  %6 = load i32*, i32** %data, align 8, !dbg !115
  %7 = bitcast i32* %6 to i8*, !dbg !115
  call void @free(i8* %7) #8, !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !118 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !121
  %tobool = icmp ne i32 %0, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.else, !dbg !123

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !124
  br label %if.end2, !dbg !126

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #8, !dbg !127
  %1 = bitcast i8* %call to i32*, !dbg !129
  store i32* %1, i32** %data.addr, align 8, !dbg !130
  %2 = load i32*, i32** %data.addr, align 8, !dbg !131
  %cmp = icmp eq i32* %2, null, !dbg !133
  br i1 %cmp, label %if.then1, label %if.end, !dbg !134

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !135
  unreachable, !dbg !135

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !137
  ret i32* %3, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  store i32* null, i32** %data, align 8, !dbg !142
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !143
  %0 = load i32*, i32** %data, align 8, !dbg !144
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !145
  store i32* %call, i32** %data, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !147, metadata !DIExpression()), !dbg !149
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !149
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !149
  %2 = load i32*, i32** %data, align 8, !dbg !150
  %3 = bitcast i32* %2 to i8*, !dbg !151
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !151
  %4 = bitcast i32* %arraydecay to i8*, !dbg !151
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !152
  %call2 = call i64 @wcslen(i32* %arraydecay1) #7, !dbg !153
  %add = add i64 %call2, 1, !dbg !154
  %mul = mul i64 %add, 4, !dbg !155
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !151
  %5 = load i32*, i32** %data, align 8, !dbg !156
  call void @printWLine(i32* %5), !dbg !157
  %6 = load i32*, i32** %data, align 8, !dbg !158
  %7 = bitcast i32* %6 to i8*, !dbg !158
  call void @free(i8* %7) #8, !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !161 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !162, metadata !DIExpression()), !dbg !163
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !164
  %tobool = icmp ne i32 %0, 0, !dbg !164
  br i1 %tobool, label %if.then, label %if.end2, !dbg !166

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #8, !dbg !167
  %1 = bitcast i8* %call to i32*, !dbg !169
  store i32* %1, i32** %data.addr, align 8, !dbg !170
  %2 = load i32*, i32** %data.addr, align 8, !dbg !171
  %cmp = icmp eq i32* %2, null, !dbg !173
  br i1 %cmp, label %if.then1, label %if.end, !dbg !174

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !175
  unreachable, !dbg !175

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !177

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !178
  ret i32* %3, !dbg !179
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 29, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 63, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 64, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_21_bad", scope: !15, file: !15, line: 42, type: !25, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 44, type: !7)
!28 = !DILocation(line: 44, column: 15, scope: !24)
!29 = !DILocation(line: 45, column: 10, scope: !24)
!30 = !DILocation(line: 46, column: 15, scope: !24)
!31 = !DILocation(line: 47, column: 22, scope: !24)
!32 = !DILocation(line: 47, column: 12, scope: !24)
!33 = !DILocation(line: 47, column: 10, scope: !24)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 49, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 48, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 352, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 49, column: 17, scope: !35)
!40 = !DILocation(line: 52, column: 16, scope: !35)
!41 = !DILocation(line: 52, column: 9, scope: !35)
!42 = !DILocation(line: 52, column: 38, scope: !35)
!43 = !DILocation(line: 52, column: 31, scope: !35)
!44 = !DILocation(line: 52, column: 46, scope: !35)
!45 = !DILocation(line: 52, column: 51, scope: !35)
!46 = !DILocation(line: 53, column: 20, scope: !35)
!47 = !DILocation(line: 53, column: 9, scope: !35)
!48 = !DILocation(line: 54, column: 14, scope: !35)
!49 = !DILocation(line: 54, column: 9, scope: !35)
!50 = !DILocation(line: 56, column: 1, scope: !24)
!51 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 31, type: !52, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!7, !7}
!54 = !DILocalVariable(name: "data", arg: 1, scope: !51, file: !15, line: 31, type: !7)
!55 = !DILocation(line: 31, column: 38, scope: !51)
!56 = !DILocation(line: 33, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !15, line: 33, column: 8)
!58 = !DILocation(line: 33, column: 8, scope: !51)
!59 = !DILocation(line: 36, column: 27, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !15, line: 34, column: 5)
!61 = !DILocation(line: 36, column: 16, scope: !60)
!62 = !DILocation(line: 36, column: 14, scope: !60)
!63 = !DILocation(line: 37, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !15, line: 37, column: 13)
!65 = !DILocation(line: 37, column: 18, scope: !64)
!66 = !DILocation(line: 37, column: 13, scope: !60)
!67 = !DILocation(line: 37, column: 28, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 37, column: 27)
!69 = !DILocation(line: 38, column: 5, scope: !60)
!70 = !DILocation(line: 39, column: 12, scope: !51)
!71 = !DILocation(line: 39, column: 5, scope: !51)
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_21_good", scope: !15, file: !15, line: 127, type: !25, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocation(line: 129, column: 5, scope: !72)
!74 = !DILocation(line: 130, column: 5, scope: !72)
!75 = !DILocation(line: 131, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 143, type: !77, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DISubroutineType(types: !78)
!78 = !{!10, !10, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !15, line: 143, type: !10)
!83 = !DILocation(line: 143, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !15, line: 143, type: !79)
!85 = !DILocation(line: 143, column: 27, scope: !76)
!86 = !DILocation(line: 146, column: 22, scope: !76)
!87 = !DILocation(line: 146, column: 12, scope: !76)
!88 = !DILocation(line: 146, column: 5, scope: !76)
!89 = !DILocation(line: 148, column: 5, scope: !76)
!90 = !DILocation(line: 149, column: 5, scope: !76)
!91 = !DILocation(line: 150, column: 5, scope: !76)
!92 = !DILocation(line: 153, column: 5, scope: !76)
!93 = !DILocation(line: 154, column: 5, scope: !76)
!94 = !DILocation(line: 155, column: 5, scope: !76)
!95 = !DILocation(line: 157, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 83, type: !25, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 85, type: !7)
!98 = !DILocation(line: 85, column: 15, scope: !96)
!99 = !DILocation(line: 86, column: 10, scope: !96)
!100 = !DILocation(line: 87, column: 20, scope: !96)
!101 = !DILocation(line: 88, column: 27, scope: !96)
!102 = !DILocation(line: 88, column: 12, scope: !96)
!103 = !DILocation(line: 88, column: 10, scope: !96)
!104 = !DILocalVariable(name: "source", scope: !105, file: !15, line: 90, type: !36)
!105 = distinct !DILexicalBlock(scope: !96, file: !15, line: 89, column: 5)
!106 = !DILocation(line: 90, column: 17, scope: !105)
!107 = !DILocation(line: 93, column: 16, scope: !105)
!108 = !DILocation(line: 93, column: 9, scope: !105)
!109 = !DILocation(line: 93, column: 38, scope: !105)
!110 = !DILocation(line: 93, column: 31, scope: !105)
!111 = !DILocation(line: 93, column: 46, scope: !105)
!112 = !DILocation(line: 93, column: 51, scope: !105)
!113 = !DILocation(line: 94, column: 20, scope: !105)
!114 = !DILocation(line: 94, column: 9, scope: !105)
!115 = !DILocation(line: 95, column: 14, scope: !105)
!116 = !DILocation(line: 95, column: 9, scope: !105)
!117 = !DILocation(line: 97, column: 1, scope: !96)
!118 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 67, type: !52, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", arg: 1, scope: !118, file: !15, line: 67, type: !7)
!120 = !DILocation(line: 67, column: 43, scope: !118)
!121 = !DILocation(line: 69, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 69, column: 8)
!123 = !DILocation(line: 69, column: 8, scope: !118)
!124 = !DILocation(line: 72, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !15, line: 70, column: 5)
!126 = !DILocation(line: 73, column: 5, scope: !125)
!127 = !DILocation(line: 77, column: 27, scope: !128)
!128 = distinct !DILexicalBlock(scope: !122, file: !15, line: 75, column: 5)
!129 = !DILocation(line: 77, column: 16, scope: !128)
!130 = !DILocation(line: 77, column: 14, scope: !128)
!131 = !DILocation(line: 78, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !15, line: 78, column: 13)
!133 = !DILocation(line: 78, column: 18, scope: !132)
!134 = !DILocation(line: 78, column: 13, scope: !128)
!135 = !DILocation(line: 78, column: 28, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 78, column: 27)
!137 = !DILocation(line: 80, column: 12, scope: !118)
!138 = !DILocation(line: 80, column: 5, scope: !118)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 111, type: !25, scopeLine: 112, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DILocalVariable(name: "data", scope: !139, file: !15, line: 113, type: !7)
!141 = !DILocation(line: 113, column: 15, scope: !139)
!142 = !DILocation(line: 114, column: 10, scope: !139)
!143 = !DILocation(line: 115, column: 20, scope: !139)
!144 = !DILocation(line: 116, column: 27, scope: !139)
!145 = !DILocation(line: 116, column: 12, scope: !139)
!146 = !DILocation(line: 116, column: 10, scope: !139)
!147 = !DILocalVariable(name: "source", scope: !148, file: !15, line: 118, type: !36)
!148 = distinct !DILexicalBlock(scope: !139, file: !15, line: 117, column: 5)
!149 = !DILocation(line: 118, column: 17, scope: !148)
!150 = !DILocation(line: 121, column: 16, scope: !148)
!151 = !DILocation(line: 121, column: 9, scope: !148)
!152 = !DILocation(line: 121, column: 38, scope: !148)
!153 = !DILocation(line: 121, column: 31, scope: !148)
!154 = !DILocation(line: 121, column: 46, scope: !148)
!155 = !DILocation(line: 121, column: 51, scope: !148)
!156 = !DILocation(line: 122, column: 20, scope: !148)
!157 = !DILocation(line: 122, column: 9, scope: !148)
!158 = !DILocation(line: 123, column: 14, scope: !148)
!159 = !DILocation(line: 123, column: 9, scope: !148)
!160 = !DILocation(line: 125, column: 1, scope: !139)
!161 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 100, type: !52, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!162 = !DILocalVariable(name: "data", arg: 1, scope: !161, file: !15, line: 100, type: !7)
!163 = !DILocation(line: 100, column: 43, scope: !161)
!164 = !DILocation(line: 102, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !15, line: 102, column: 8)
!166 = !DILocation(line: 102, column: 8, scope: !161)
!167 = !DILocation(line: 105, column: 27, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !15, line: 103, column: 5)
!169 = !DILocation(line: 105, column: 16, scope: !168)
!170 = !DILocation(line: 105, column: 14, scope: !168)
!171 = !DILocation(line: 106, column: 13, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !15, line: 106, column: 13)
!173 = !DILocation(line: 106, column: 18, scope: !172)
!174 = !DILocation(line: 106, column: 13, scope: !168)
!175 = !DILocation(line: 106, column: 28, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !15, line: 106, column: 27)
!177 = !DILocation(line: 107, column: 5, scope: !168)
!178 = !DILocation(line: 108, column: 12, scope: !161)
!179 = !DILocation(line: 108, column: 5, scope: !161)
