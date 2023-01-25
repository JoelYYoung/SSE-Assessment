; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_11.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_11_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %call = call i32 (...) @globalReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !32
  %4 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !41
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !42
  %6 = bitcast i32* %arraydecay to i8*, !dbg !42
  %7 = load i32*, i32** %data, align 8, !dbg !43
  %8 = bitcast i32* %7 to i8*, !dbg !42
  %9 = load i32*, i32** %data, align 8, !dbg !44
  %call2 = call i64 @wcslen(i32* %9) #8, !dbg !45
  %mul = mul i64 %call2, 4, !dbg !46
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !42
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !47
  store i32 0, i32* %arrayidx3, align 4, !dbg !48
  %10 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %10), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_11_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_11_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_11_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 400, align 16, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %dataBuffer, align 8, !dbg !80
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  store i32* %2, i32** %data, align 8, !dbg !84
  %call = call i32 (...) @globalReturnsFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !91
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !93
  %4 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !99
  %6 = bitcast i32* %arraydecay to i8*, !dbg !99
  %7 = load i32*, i32** %data, align 8, !dbg !100
  %8 = bitcast i32* %7 to i8*, !dbg !99
  %9 = load i32*, i32** %data, align 8, !dbg !101
  %call2 = call i64 @wcslen(i32* %9) #8, !dbg !102
  %mul = mul i64 %call2, 4, !dbg !103
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !99
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !104
  store i32 0, i32* %arrayidx3, align 4, !dbg !105
  %10 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* %10), !dbg !107
  ret void, !dbg !108
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 400, align 16, !dbg !114
  %1 = bitcast i8* %0 to i32*, !dbg !115
  store i32* %1, i32** %dataBuffer, align 8, !dbg !113
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  store i32* %2, i32** %data, align 8, !dbg !117
  %call = call i32 (...) @globalReturnsTrue(), !dbg !118
  %tobool = icmp ne i32 %call, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !121
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !123
  %4 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !129
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !130
  %6 = bitcast i32* %arraydecay to i8*, !dbg !130
  %7 = load i32*, i32** %data, align 8, !dbg !131
  %8 = bitcast i32* %7 to i8*, !dbg !130
  %9 = load i32*, i32** %data, align 8, !dbg !132
  %call2 = call i64 @wcslen(i32* %9) #8, !dbg !133
  %mul = mul i64 %call2, 4, !dbg !134
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !130
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !135
  store i32 0, i32* %arrayidx3, align 4, !dbg !136
  %10 = load i32*, i32** %data, align 8, !dbg !137
  call void @printWLine(i32* %10), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_11_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_11.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 12, scope: !15)
!26 = !DILocation(line: 27, column: 10, scope: !15)
!27 = !DILocation(line: 28, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!29 = !DILocation(line: 28, column: 8, scope: !15)
!30 = !DILocation(line: 31, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !16, line: 29, column: 5)
!32 = !DILocation(line: 31, column: 9, scope: !31)
!33 = !DILocation(line: 32, column: 9, scope: !31)
!34 = !DILocation(line: 32, column: 21, scope: !31)
!35 = !DILocation(line: 33, column: 5, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !16, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 35, column: 17, scope: !37)
!42 = !DILocation(line: 37, column: 9, scope: !37)
!43 = !DILocation(line: 37, column: 23, scope: !37)
!44 = !DILocation(line: 37, column: 36, scope: !37)
!45 = !DILocation(line: 37, column: 29, scope: !37)
!46 = !DILocation(line: 37, column: 41, scope: !37)
!47 = !DILocation(line: 38, column: 9, scope: !37)
!48 = !DILocation(line: 38, column: 20, scope: !37)
!49 = !DILocation(line: 39, column: 20, scope: !37)
!50 = !DILocation(line: 39, column: 9, scope: !37)
!51 = !DILocation(line: 41, column: 1, scope: !15)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_11_good", scope: !16, file: !16, line: 94, type: !17, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 96, column: 5, scope: !52)
!54 = !DILocation(line: 97, column: 5, scope: !52)
!55 = !DILocation(line: 98, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 110, type: !57, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!7, !7, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !16, line: 110, type: !7)
!63 = !DILocation(line: 110, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !16, line: 110, type: !59)
!65 = !DILocation(line: 110, column: 27, scope: !56)
!66 = !DILocation(line: 113, column: 22, scope: !56)
!67 = !DILocation(line: 113, column: 12, scope: !56)
!68 = !DILocation(line: 113, column: 5, scope: !56)
!69 = !DILocation(line: 115, column: 5, scope: !56)
!70 = !DILocation(line: 116, column: 5, scope: !56)
!71 = !DILocation(line: 117, column: 5, scope: !56)
!72 = !DILocation(line: 120, column: 5, scope: !56)
!73 = !DILocation(line: 121, column: 5, scope: !56)
!74 = !DILocation(line: 122, column: 5, scope: !56)
!75 = !DILocation(line: 124, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !16, line: 50, type: !4)
!78 = !DILocation(line: 50, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !16, line: 51, type: !4)
!80 = !DILocation(line: 51, column: 15, scope: !76)
!81 = !DILocation(line: 51, column: 39, scope: !76)
!82 = !DILocation(line: 51, column: 28, scope: !76)
!83 = !DILocation(line: 52, column: 12, scope: !76)
!84 = !DILocation(line: 52, column: 10, scope: !76)
!85 = !DILocation(line: 53, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !76, file: !16, line: 53, column: 8)
!87 = !DILocation(line: 53, column: 8, scope: !76)
!88 = !DILocation(line: 56, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !16, line: 54, column: 5)
!90 = !DILocation(line: 57, column: 5, scope: !89)
!91 = !DILocation(line: 61, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !16, line: 59, column: 5)
!93 = !DILocation(line: 61, column: 9, scope: !92)
!94 = !DILocation(line: 62, column: 9, scope: !92)
!95 = !DILocation(line: 62, column: 20, scope: !92)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !16, line: 65, type: !38)
!97 = distinct !DILexicalBlock(scope: !76, file: !16, line: 64, column: 5)
!98 = !DILocation(line: 65, column: 17, scope: !97)
!99 = !DILocation(line: 67, column: 9, scope: !97)
!100 = !DILocation(line: 67, column: 23, scope: !97)
!101 = !DILocation(line: 67, column: 36, scope: !97)
!102 = !DILocation(line: 67, column: 29, scope: !97)
!103 = !DILocation(line: 67, column: 41, scope: !97)
!104 = !DILocation(line: 68, column: 9, scope: !97)
!105 = !DILocation(line: 68, column: 20, scope: !97)
!106 = !DILocation(line: 69, column: 20, scope: !97)
!107 = !DILocation(line: 69, column: 9, scope: !97)
!108 = !DILocation(line: 71, column: 1, scope: !76)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 74, type: !17, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !16, line: 76, type: !4)
!111 = !DILocation(line: 76, column: 15, scope: !109)
!112 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !16, line: 77, type: !4)
!113 = !DILocation(line: 77, column: 15, scope: !109)
!114 = !DILocation(line: 77, column: 39, scope: !109)
!115 = !DILocation(line: 77, column: 28, scope: !109)
!116 = !DILocation(line: 78, column: 12, scope: !109)
!117 = !DILocation(line: 78, column: 10, scope: !109)
!118 = !DILocation(line: 79, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !109, file: !16, line: 79, column: 8)
!120 = !DILocation(line: 79, column: 8, scope: !109)
!121 = !DILocation(line: 82, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !16, line: 80, column: 5)
!123 = !DILocation(line: 82, column: 9, scope: !122)
!124 = !DILocation(line: 83, column: 9, scope: !122)
!125 = !DILocation(line: 83, column: 20, scope: !122)
!126 = !DILocation(line: 84, column: 5, scope: !122)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !16, line: 86, type: !38)
!128 = distinct !DILexicalBlock(scope: !109, file: !16, line: 85, column: 5)
!129 = !DILocation(line: 86, column: 17, scope: !128)
!130 = !DILocation(line: 88, column: 9, scope: !128)
!131 = !DILocation(line: 88, column: 23, scope: !128)
!132 = !DILocation(line: 88, column: 36, scope: !128)
!133 = !DILocation(line: 88, column: 29, scope: !128)
!134 = !DILocation(line: 88, column: 41, scope: !128)
!135 = !DILocation(line: 89, column: 9, scope: !128)
!136 = !DILocation(line: 89, column: 20, scope: !128)
!137 = !DILocation(line: 90, column: 20, scope: !128)
!138 = !DILocation(line: 90, column: 9, scope: !128)
!139 = !DILocation(line: 92, column: 1, scope: !109)
