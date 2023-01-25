; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  %3 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %3, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #7, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !47
  %7 = bitcast i32* %arraydecay to i8*, !dbg !47
  %8 = load i32*, i32** %data, align 8, !dbg !48
  %9 = bitcast i32* %8 to i8*, !dbg !47
  %10 = load i32*, i32** %data, align 8, !dbg !49
  %call1 = call i64 @wcslen(i32* %10) #8, !dbg !50
  %mul = mul i64 %call1, 4, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 %mul, i1 false), !dbg !47
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !52
  store i32 0, i32* %arrayidx2, align 4, !dbg !53
  %11 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* %11), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_05_good() #0 !dbg !57 {
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
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_05_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_05_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 400, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBuffer, align 8, !dbg !85
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  store i32* %2, i32** %data, align 8, !dbg !89
  %3 = load i32, i32* @staticFalse, align 4, !dbg !90
  %tobool = icmp ne i32 %3, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !96
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !98
  %5 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !103
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !104
  %7 = bitcast i32* %arraydecay to i8*, !dbg !104
  %8 = load i32*, i32** %data, align 8, !dbg !105
  %9 = bitcast i32* %8 to i8*, !dbg !104
  %10 = load i32*, i32** %data, align 8, !dbg !106
  %call1 = call i64 @wcslen(i32* %10) #8, !dbg !107
  %mul = mul i64 %call1, 4, !dbg !108
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 %mul, i1 false), !dbg !104
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !109
  store i32 0, i32* %arrayidx2, align 4, !dbg !110
  %11 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* %11), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = alloca i8, i64 400, align 16, !dbg !119
  %1 = bitcast i8* %0 to i32*, !dbg !120
  store i32* %1, i32** %dataBuffer, align 8, !dbg !118
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  store i32* %2, i32** %data, align 8, !dbg !122
  %3 = load i32, i32* @staticTrue, align 4, !dbg !123
  %tobool = icmp ne i32 %3, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !126
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !128
  %5 = load i32*, i32** %data, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  br label %if.end, !dbg !131

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !132, metadata !DIExpression()), !dbg !134
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !134
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !135
  %7 = bitcast i32* %arraydecay to i8*, !dbg !135
  %8 = load i32*, i32** %data, align 8, !dbg !136
  %9 = bitcast i32* %8 to i8*, !dbg !135
  %10 = load i32*, i32** %data, align 8, !dbg !137
  %call1 = call i64 @wcslen(i32* %10) #8, !dbg !138
  %mul = mul i64 %call1, 4, !dbg !139
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 %mul, i1 false), !dbg !135
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !140
  store i32 0, i32* %arrayidx2, align 4, !dbg !141
  %11 = load i32*, i32** %data, align 8, !dbg !142
  call void @printWLine(i32* %11), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 26, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_05_bad", scope: !14, file: !14, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 15, scope: !21)
!28 = !DILocation(line: 33, column: 39, scope: !21)
!29 = !DILocation(line: 33, column: 28, scope: !21)
!30 = !DILocation(line: 34, column: 12, scope: !21)
!31 = !DILocation(line: 34, column: 10, scope: !21)
!32 = !DILocation(line: 35, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !21, file: !14, line: 35, column: 8)
!34 = !DILocation(line: 35, column: 8, scope: !21)
!35 = !DILocation(line: 38, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !14, line: 36, column: 5)
!37 = !DILocation(line: 38, column: 9, scope: !36)
!38 = !DILocation(line: 39, column: 9, scope: !36)
!39 = !DILocation(line: 39, column: 21, scope: !36)
!40 = !DILocation(line: 40, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !14, line: 42, type: !43)
!42 = distinct !DILexicalBlock(scope: !21, file: !14, line: 41, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 42, column: 17, scope: !42)
!47 = !DILocation(line: 44, column: 9, scope: !42)
!48 = !DILocation(line: 44, column: 23, scope: !42)
!49 = !DILocation(line: 44, column: 36, scope: !42)
!50 = !DILocation(line: 44, column: 29, scope: !42)
!51 = !DILocation(line: 44, column: 41, scope: !42)
!52 = !DILocation(line: 45, column: 9, scope: !42)
!53 = !DILocation(line: 45, column: 20, scope: !42)
!54 = !DILocation(line: 46, column: 20, scope: !42)
!55 = !DILocation(line: 46, column: 9, scope: !42)
!56 = !DILocation(line: 48, column: 1, scope: !21)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_05_good", scope: !14, file: !14, line: 101, type: !22, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 103, column: 5, scope: !57)
!59 = !DILocation(line: 104, column: 5, scope: !57)
!60 = !DILocation(line: 105, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 117, type: !62, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!9, !9, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !14, line: 117, type: !9)
!68 = !DILocation(line: 117, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !14, line: 117, type: !64)
!70 = !DILocation(line: 117, column: 27, scope: !61)
!71 = !DILocation(line: 120, column: 22, scope: !61)
!72 = !DILocation(line: 120, column: 12, scope: !61)
!73 = !DILocation(line: 120, column: 5, scope: !61)
!74 = !DILocation(line: 122, column: 5, scope: !61)
!75 = !DILocation(line: 123, column: 5, scope: !61)
!76 = !DILocation(line: 124, column: 5, scope: !61)
!77 = !DILocation(line: 127, column: 5, scope: !61)
!78 = !DILocation(line: 128, column: 5, scope: !61)
!79 = !DILocation(line: 129, column: 5, scope: !61)
!80 = !DILocation(line: 131, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 55, type: !22, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !14, line: 57, type: !6)
!83 = !DILocation(line: 57, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !14, line: 58, type: !6)
!85 = !DILocation(line: 58, column: 15, scope: !81)
!86 = !DILocation(line: 58, column: 39, scope: !81)
!87 = !DILocation(line: 58, column: 28, scope: !81)
!88 = !DILocation(line: 59, column: 12, scope: !81)
!89 = !DILocation(line: 59, column: 10, scope: !81)
!90 = !DILocation(line: 60, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !81, file: !14, line: 60, column: 8)
!92 = !DILocation(line: 60, column: 8, scope: !81)
!93 = !DILocation(line: 63, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !14, line: 61, column: 5)
!95 = !DILocation(line: 64, column: 5, scope: !94)
!96 = !DILocation(line: 68, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !14, line: 66, column: 5)
!98 = !DILocation(line: 68, column: 9, scope: !97)
!99 = !DILocation(line: 69, column: 9, scope: !97)
!100 = !DILocation(line: 69, column: 20, scope: !97)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !14, line: 72, type: !43)
!102 = distinct !DILexicalBlock(scope: !81, file: !14, line: 71, column: 5)
!103 = !DILocation(line: 72, column: 17, scope: !102)
!104 = !DILocation(line: 74, column: 9, scope: !102)
!105 = !DILocation(line: 74, column: 23, scope: !102)
!106 = !DILocation(line: 74, column: 36, scope: !102)
!107 = !DILocation(line: 74, column: 29, scope: !102)
!108 = !DILocation(line: 74, column: 41, scope: !102)
!109 = !DILocation(line: 75, column: 9, scope: !102)
!110 = !DILocation(line: 75, column: 20, scope: !102)
!111 = !DILocation(line: 76, column: 20, scope: !102)
!112 = !DILocation(line: 76, column: 9, scope: !102)
!113 = !DILocation(line: 78, column: 1, scope: !81)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 81, type: !22, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!115 = !DILocalVariable(name: "data", scope: !114, file: !14, line: 83, type: !6)
!116 = !DILocation(line: 83, column: 15, scope: !114)
!117 = !DILocalVariable(name: "dataBuffer", scope: !114, file: !14, line: 84, type: !6)
!118 = !DILocation(line: 84, column: 15, scope: !114)
!119 = !DILocation(line: 84, column: 39, scope: !114)
!120 = !DILocation(line: 84, column: 28, scope: !114)
!121 = !DILocation(line: 85, column: 12, scope: !114)
!122 = !DILocation(line: 85, column: 10, scope: !114)
!123 = !DILocation(line: 86, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !14, line: 86, column: 8)
!125 = !DILocation(line: 86, column: 8, scope: !114)
!126 = !DILocation(line: 89, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !14, line: 87, column: 5)
!128 = !DILocation(line: 89, column: 9, scope: !127)
!129 = !DILocation(line: 90, column: 9, scope: !127)
!130 = !DILocation(line: 90, column: 20, scope: !127)
!131 = !DILocation(line: 91, column: 5, scope: !127)
!132 = !DILocalVariable(name: "dest", scope: !133, file: !14, line: 93, type: !43)
!133 = distinct !DILexicalBlock(scope: !114, file: !14, line: 92, column: 5)
!134 = !DILocation(line: 93, column: 17, scope: !133)
!135 = !DILocation(line: 95, column: 9, scope: !133)
!136 = !DILocation(line: 95, column: 23, scope: !133)
!137 = !DILocation(line: 95, column: 36, scope: !133)
!138 = !DILocation(line: 95, column: 29, scope: !133)
!139 = !DILocation(line: 95, column: 41, scope: !133)
!140 = !DILocation(line: 96, column: 9, scope: !133)
!141 = !DILocation(line: 96, column: 20, scope: !133)
!142 = !DILocation(line: 97, column: 20, scope: !133)
!143 = !DILocation(line: 97, column: 9, scope: !133)
!144 = !DILocation(line: 99, column: 1, scope: !114)
