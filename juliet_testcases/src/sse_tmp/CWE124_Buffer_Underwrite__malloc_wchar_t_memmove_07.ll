; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end4, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !34
  %1 = bitcast i8* %call to i32*, !dbg !35
  store i32* %1, i32** %dataBuffer, align 8, !dbg !33
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %cmp1 = icmp eq i32* %2, null, !dbg !38
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !39

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !43
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !46
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !47
  store i32* %add.ptr, i32** %data, align 8, !dbg !48
  br label %if.end4, !dbg !49

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !57
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx6, align 4, !dbg !59
  %6 = load i32*, i32** %data, align 8, !dbg !60
  %7 = bitcast i32* %6 to i8*, !dbg !61
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !61
  %8 = bitcast i32* %arraydecay7 to i8*, !dbg !61
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !61
  %9 = load i32*, i32** %data, align 8, !dbg !62
  %arrayidx8 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !62
  store i32 0, i32* %arrayidx8, align 4, !dbg !63
  %10 = load i32*, i32** %data, align 8, !dbg !64
  call void @printWLine(i32* %10), !dbg !65
  ret void, !dbg !66
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
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_07_good() #0 !dbg !67 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #6, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #6, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_07_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_07_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %0 = load i32, i32* @staticFive, align 4, !dbg !95
  %cmp = icmp ne i32 %0, 5, !dbg !97
  br i1 %cmp, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end4, !dbg !101

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !106
  %1 = bitcast i8* %call to i32*, !dbg !107
  store i32* %1, i32** %dataBuffer, align 8, !dbg !105
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  %cmp1 = icmp eq i32* %2, null, !dbg !110
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !111

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !114
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !115
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  store i32* %5, i32** %data, align 8, !dbg !119
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !124
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx6, align 4, !dbg !126
  %6 = load i32*, i32** %data, align 8, !dbg !127
  %7 = bitcast i32* %6 to i8*, !dbg !128
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !128
  %8 = bitcast i32* %arraydecay7 to i8*, !dbg !128
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !128
  %9 = load i32*, i32** %data, align 8, !dbg !129
  %arrayidx8 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !129
  store i32 0, i32* %arrayidx8, align 4, !dbg !130
  %10 = load i32*, i32** %data, align 8, !dbg !131
  call void @printWLine(i32* %10), !dbg !132
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !134 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !135, metadata !DIExpression()), !dbg !136
  store i32* null, i32** %data, align 8, !dbg !137
  %0 = load i32, i32* @staticFive, align 4, !dbg !138
  %cmp = icmp eq i32 %0, 5, !dbg !140
  br i1 %cmp, label %if.then, label %if.end4, !dbg !141

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !142, metadata !DIExpression()), !dbg !145
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !146
  %1 = bitcast i8* %call to i32*, !dbg !147
  store i32* %1, i32** %dataBuffer, align 8, !dbg !145
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !148
  %cmp1 = icmp eq i32* %2, null, !dbg !150
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !151

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !152
  unreachable, !dbg !152

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !154
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !155
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !156
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !156
  store i32 0, i32* %arrayidx, align 4, !dbg !157
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !158
  store i32* %5, i32** %data, align 8, !dbg !159
  br label %if.end4, !dbg !160

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !161, metadata !DIExpression()), !dbg !163
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !164
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !165
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !166
  store i32 0, i32* %arrayidx6, align 4, !dbg !167
  %6 = load i32*, i32** %data, align 8, !dbg !168
  %7 = bitcast i32* %6 to i8*, !dbg !169
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !169
  %8 = bitcast i32* %arraydecay7 to i8*, !dbg !169
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !169
  %9 = load i32*, i32** %data, align 8, !dbg !170
  %arrayidx8 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !170
  store i32 0, i32* %arrayidx8, align 4, !dbg !171
  %10 = load i32*, i32** %data, align 8, !dbg !172
  call void @printWLine(i32* %10), !dbg !173
  ret void, !dbg !174
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_07_bad", scope: !13, file: !13, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 31, type: !6)
!24 = !DILocation(line: 31, column: 15, scope: !20)
!25 = !DILocation(line: 32, column: 10, scope: !20)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 18, scope: !27)
!29 = !DILocation(line: 33, column: 8, scope: !20)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !13, line: 36, type: !6)
!31 = distinct !DILexicalBlock(scope: !32, file: !13, line: 35, column: 9)
!32 = distinct !DILexicalBlock(scope: !27, file: !13, line: 34, column: 5)
!33 = !DILocation(line: 36, column: 23, scope: !31)
!34 = !DILocation(line: 36, column: 47, scope: !31)
!35 = !DILocation(line: 36, column: 36, scope: !31)
!36 = !DILocation(line: 37, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !13, line: 37, column: 17)
!38 = !DILocation(line: 37, column: 28, scope: !37)
!39 = !DILocation(line: 37, column: 17, scope: !31)
!40 = !DILocation(line: 37, column: 38, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !13, line: 37, column: 37)
!42 = !DILocation(line: 38, column: 21, scope: !31)
!43 = !DILocation(line: 38, column: 13, scope: !31)
!44 = !DILocation(line: 39, column: 13, scope: !31)
!45 = !DILocation(line: 39, column: 31, scope: !31)
!46 = !DILocation(line: 41, column: 20, scope: !31)
!47 = !DILocation(line: 41, column: 31, scope: !31)
!48 = !DILocation(line: 41, column: 18, scope: !31)
!49 = !DILocation(line: 43, column: 5, scope: !32)
!50 = !DILocalVariable(name: "source", scope: !51, file: !13, line: 45, type: !52)
!51 = distinct !DILexicalBlock(scope: !20, file: !13, line: 44, column: 5)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 45, column: 17, scope: !51)
!56 = !DILocation(line: 46, column: 17, scope: !51)
!57 = !DILocation(line: 46, column: 9, scope: !51)
!58 = !DILocation(line: 47, column: 9, scope: !51)
!59 = !DILocation(line: 47, column: 23, scope: !51)
!60 = !DILocation(line: 49, column: 17, scope: !51)
!61 = !DILocation(line: 49, column: 9, scope: !51)
!62 = !DILocation(line: 51, column: 9, scope: !51)
!63 = !DILocation(line: 51, column: 21, scope: !51)
!64 = !DILocation(line: 52, column: 20, scope: !51)
!65 = !DILocation(line: 52, column: 9, scope: !51)
!66 = !DILocation(line: 56, column: 1, scope: !20)
!67 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_07_good", scope: !13, file: !13, line: 127, type: !21, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocation(line: 129, column: 5, scope: !67)
!69 = !DILocation(line: 130, column: 5, scope: !67)
!70 = !DILocation(line: 131, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 143, type: !72, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!9, !9, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !13, line: 143, type: !9)
!78 = !DILocation(line: 143, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !13, line: 143, type: !74)
!80 = !DILocation(line: 143, column: 27, scope: !71)
!81 = !DILocation(line: 146, column: 22, scope: !71)
!82 = !DILocation(line: 146, column: 12, scope: !71)
!83 = !DILocation(line: 146, column: 5, scope: !71)
!84 = !DILocation(line: 148, column: 5, scope: !71)
!85 = !DILocation(line: 149, column: 5, scope: !71)
!86 = !DILocation(line: 150, column: 5, scope: !71)
!87 = !DILocation(line: 153, column: 5, scope: !71)
!88 = !DILocation(line: 154, column: 5, scope: !71)
!89 = !DILocation(line: 155, column: 5, scope: !71)
!90 = !DILocation(line: 157, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 63, type: !21, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocalVariable(name: "data", scope: !91, file: !13, line: 65, type: !6)
!93 = !DILocation(line: 65, column: 15, scope: !91)
!94 = !DILocation(line: 66, column: 10, scope: !91)
!95 = !DILocation(line: 67, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !13, line: 67, column: 8)
!97 = !DILocation(line: 67, column: 18, scope: !96)
!98 = !DILocation(line: 67, column: 8, scope: !91)
!99 = !DILocation(line: 70, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !13, line: 68, column: 5)
!101 = !DILocation(line: 71, column: 5, scope: !100)
!102 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !13, line: 75, type: !6)
!103 = distinct !DILexicalBlock(scope: !104, file: !13, line: 74, column: 9)
!104 = distinct !DILexicalBlock(scope: !96, file: !13, line: 73, column: 5)
!105 = !DILocation(line: 75, column: 23, scope: !103)
!106 = !DILocation(line: 75, column: 47, scope: !103)
!107 = !DILocation(line: 75, column: 36, scope: !103)
!108 = !DILocation(line: 76, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !13, line: 76, column: 17)
!110 = !DILocation(line: 76, column: 28, scope: !109)
!111 = !DILocation(line: 76, column: 17, scope: !103)
!112 = !DILocation(line: 76, column: 38, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !13, line: 76, column: 37)
!114 = !DILocation(line: 77, column: 21, scope: !103)
!115 = !DILocation(line: 77, column: 13, scope: !103)
!116 = !DILocation(line: 78, column: 13, scope: !103)
!117 = !DILocation(line: 78, column: 31, scope: !103)
!118 = !DILocation(line: 80, column: 20, scope: !103)
!119 = !DILocation(line: 80, column: 18, scope: !103)
!120 = !DILocalVariable(name: "source", scope: !121, file: !13, line: 84, type: !52)
!121 = distinct !DILexicalBlock(scope: !91, file: !13, line: 83, column: 5)
!122 = !DILocation(line: 84, column: 17, scope: !121)
!123 = !DILocation(line: 85, column: 17, scope: !121)
!124 = !DILocation(line: 85, column: 9, scope: !121)
!125 = !DILocation(line: 86, column: 9, scope: !121)
!126 = !DILocation(line: 86, column: 23, scope: !121)
!127 = !DILocation(line: 88, column: 17, scope: !121)
!128 = !DILocation(line: 88, column: 9, scope: !121)
!129 = !DILocation(line: 90, column: 9, scope: !121)
!130 = !DILocation(line: 90, column: 21, scope: !121)
!131 = !DILocation(line: 91, column: 20, scope: !121)
!132 = !DILocation(line: 91, column: 9, scope: !121)
!133 = !DILocation(line: 95, column: 1, scope: !91)
!134 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 98, type: !21, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!135 = !DILocalVariable(name: "data", scope: !134, file: !13, line: 100, type: !6)
!136 = !DILocation(line: 100, column: 15, scope: !134)
!137 = !DILocation(line: 101, column: 10, scope: !134)
!138 = !DILocation(line: 102, column: 8, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !13, line: 102, column: 8)
!140 = !DILocation(line: 102, column: 18, scope: !139)
!141 = !DILocation(line: 102, column: 8, scope: !134)
!142 = !DILocalVariable(name: "dataBuffer", scope: !143, file: !13, line: 105, type: !6)
!143 = distinct !DILexicalBlock(scope: !144, file: !13, line: 104, column: 9)
!144 = distinct !DILexicalBlock(scope: !139, file: !13, line: 103, column: 5)
!145 = !DILocation(line: 105, column: 23, scope: !143)
!146 = !DILocation(line: 105, column: 47, scope: !143)
!147 = !DILocation(line: 105, column: 36, scope: !143)
!148 = !DILocation(line: 106, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !143, file: !13, line: 106, column: 17)
!150 = !DILocation(line: 106, column: 28, scope: !149)
!151 = !DILocation(line: 106, column: 17, scope: !143)
!152 = !DILocation(line: 106, column: 38, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !13, line: 106, column: 37)
!154 = !DILocation(line: 107, column: 21, scope: !143)
!155 = !DILocation(line: 107, column: 13, scope: !143)
!156 = !DILocation(line: 108, column: 13, scope: !143)
!157 = !DILocation(line: 108, column: 31, scope: !143)
!158 = !DILocation(line: 110, column: 20, scope: !143)
!159 = !DILocation(line: 110, column: 18, scope: !143)
!160 = !DILocation(line: 112, column: 5, scope: !144)
!161 = !DILocalVariable(name: "source", scope: !162, file: !13, line: 114, type: !52)
!162 = distinct !DILexicalBlock(scope: !134, file: !13, line: 113, column: 5)
!163 = !DILocation(line: 114, column: 17, scope: !162)
!164 = !DILocation(line: 115, column: 17, scope: !162)
!165 = !DILocation(line: 115, column: 9, scope: !162)
!166 = !DILocation(line: 116, column: 9, scope: !162)
!167 = !DILocation(line: 116, column: 23, scope: !162)
!168 = !DILocation(line: 118, column: 17, scope: !162)
!169 = !DILocation(line: 118, column: 9, scope: !162)
!170 = !DILocation(line: 120, column: 9, scope: !162)
!171 = !DILocation(line: 120, column: 21, scope: !162)
!172 = !DILocation(line: 121, column: 20, scope: !162)
!173 = !DILocation(line: 121, column: 9, scope: !162)
!174 = !DILocation(line: 125, column: 1, scope: !134)
