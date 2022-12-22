; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_08_bad() #0 !dbg !15 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !27
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_08_good() #0 !dbg !52 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_08_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_08_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !76 {
entry:
  ret i32 1, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 400, align 16, !dbg !85
  %1 = bitcast i8* %0 to i32*, !dbg !86
  store i32* %1, i32** %dataBuffer, align 8, !dbg !84
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  store i32* %2, i32** %data, align 8, !dbg !88
  %call = call i32 @staticReturnsFalse(), !dbg !89
  %tobool = icmp ne i32 %call, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !95
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !97
  %4 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !103
  %6 = bitcast i32* %arraydecay to i8*, !dbg !103
  %7 = load i32*, i32** %data, align 8, !dbg !104
  %8 = bitcast i32* %7 to i8*, !dbg !103
  %9 = load i32*, i32** %data, align 8, !dbg !105
  %call2 = call i64 @wcslen(i32* %9) #8, !dbg !106
  %mul = mul i64 %call2, 4, !dbg !107
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !103
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !108
  store i32 0, i32* %arrayidx3, align 4, !dbg !109
  %10 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* %10), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !113 {
entry:
  ret i32 0, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = alloca i8, i64 400, align 16, !dbg !120
  %1 = bitcast i8* %0 to i32*, !dbg !121
  store i32* %1, i32** %dataBuffer, align 8, !dbg !119
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !122
  store i32* %2, i32** %data, align 8, !dbg !123
  %call = call i32 @staticReturnsTrue(), !dbg !124
  %tobool = icmp ne i32 %call, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !127
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !129
  %4 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  br label %if.end, !dbg !132

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !135
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !136
  %6 = bitcast i32* %arraydecay to i8*, !dbg !136
  %7 = load i32*, i32** %data, align 8, !dbg !137
  %8 = bitcast i32* %7 to i8*, !dbg !136
  %9 = load i32*, i32** %data, align 8, !dbg !138
  %call2 = call i64 @wcslen(i32* %9) #8, !dbg !139
  %mul = mul i64 %call2, 4, !dbg !140
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !136
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !141
  store i32 0, i32* %arrayidx3, align 4, !dbg !142
  %10 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %10), !dbg !144
  ret void, !dbg !145
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_08_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_08.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 40, type: !4)
!22 = !DILocation(line: 40, column: 15, scope: !15)
!23 = !DILocation(line: 40, column: 39, scope: !15)
!24 = !DILocation(line: 40, column: 28, scope: !15)
!25 = !DILocation(line: 41, column: 12, scope: !15)
!26 = !DILocation(line: 41, column: 10, scope: !15)
!27 = !DILocation(line: 42, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 8)
!29 = !DILocation(line: 42, column: 8, scope: !15)
!30 = !DILocation(line: 45, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !16, line: 43, column: 5)
!32 = !DILocation(line: 45, column: 9, scope: !31)
!33 = !DILocation(line: 46, column: 9, scope: !31)
!34 = !DILocation(line: 46, column: 21, scope: !31)
!35 = !DILocation(line: 47, column: 5, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !16, line: 49, type: !38)
!37 = distinct !DILexicalBlock(scope: !15, file: !16, line: 48, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 49, column: 17, scope: !37)
!42 = !DILocation(line: 51, column: 9, scope: !37)
!43 = !DILocation(line: 51, column: 23, scope: !37)
!44 = !DILocation(line: 51, column: 36, scope: !37)
!45 = !DILocation(line: 51, column: 29, scope: !37)
!46 = !DILocation(line: 51, column: 41, scope: !37)
!47 = !DILocation(line: 52, column: 9, scope: !37)
!48 = !DILocation(line: 52, column: 20, scope: !37)
!49 = !DILocation(line: 53, column: 20, scope: !37)
!50 = !DILocation(line: 53, column: 9, scope: !37)
!51 = !DILocation(line: 55, column: 1, scope: !15)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_08_good", scope: !16, file: !16, line: 108, type: !17, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 110, column: 5, scope: !52)
!54 = !DILocation(line: 111, column: 5, scope: !52)
!55 = !DILocation(line: 112, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 124, type: !57, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!7, !7, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !16, line: 124, type: !7)
!63 = !DILocation(line: 124, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !16, line: 124, type: !59)
!65 = !DILocation(line: 124, column: 27, scope: !56)
!66 = !DILocation(line: 127, column: 22, scope: !56)
!67 = !DILocation(line: 127, column: 12, scope: !56)
!68 = !DILocation(line: 127, column: 5, scope: !56)
!69 = !DILocation(line: 129, column: 5, scope: !56)
!70 = !DILocation(line: 130, column: 5, scope: !56)
!71 = !DILocation(line: 131, column: 5, scope: !56)
!72 = !DILocation(line: 134, column: 5, scope: !56)
!73 = !DILocation(line: 135, column: 5, scope: !56)
!74 = !DILocation(line: 136, column: 5, scope: !56)
!75 = !DILocation(line: 138, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 25, type: !77, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!7}
!79 = !DILocation(line: 27, column: 5, scope: !76)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 62, type: !17, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !16, line: 64, type: !4)
!82 = !DILocation(line: 64, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !16, line: 65, type: !4)
!84 = !DILocation(line: 65, column: 15, scope: !80)
!85 = !DILocation(line: 65, column: 39, scope: !80)
!86 = !DILocation(line: 65, column: 28, scope: !80)
!87 = !DILocation(line: 66, column: 12, scope: !80)
!88 = !DILocation(line: 66, column: 10, scope: !80)
!89 = !DILocation(line: 67, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !16, line: 67, column: 8)
!91 = !DILocation(line: 67, column: 8, scope: !80)
!92 = !DILocation(line: 70, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !16, line: 68, column: 5)
!94 = !DILocation(line: 71, column: 5, scope: !93)
!95 = !DILocation(line: 75, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !16, line: 73, column: 5)
!97 = !DILocation(line: 75, column: 9, scope: !96)
!98 = !DILocation(line: 76, column: 9, scope: !96)
!99 = !DILocation(line: 76, column: 20, scope: !96)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !16, line: 79, type: !38)
!101 = distinct !DILexicalBlock(scope: !80, file: !16, line: 78, column: 5)
!102 = !DILocation(line: 79, column: 17, scope: !101)
!103 = !DILocation(line: 81, column: 9, scope: !101)
!104 = !DILocation(line: 81, column: 23, scope: !101)
!105 = !DILocation(line: 81, column: 36, scope: !101)
!106 = !DILocation(line: 81, column: 29, scope: !101)
!107 = !DILocation(line: 81, column: 41, scope: !101)
!108 = !DILocation(line: 82, column: 9, scope: !101)
!109 = !DILocation(line: 82, column: 20, scope: !101)
!110 = !DILocation(line: 83, column: 20, scope: !101)
!111 = !DILocation(line: 83, column: 9, scope: !101)
!112 = !DILocation(line: 85, column: 1, scope: !80)
!113 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 30, type: !77, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocation(line: 32, column: 5, scope: !113)
!115 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 88, type: !17, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !16, line: 90, type: !4)
!117 = !DILocation(line: 90, column: 15, scope: !115)
!118 = !DILocalVariable(name: "dataBuffer", scope: !115, file: !16, line: 91, type: !4)
!119 = !DILocation(line: 91, column: 15, scope: !115)
!120 = !DILocation(line: 91, column: 39, scope: !115)
!121 = !DILocation(line: 91, column: 28, scope: !115)
!122 = !DILocation(line: 92, column: 12, scope: !115)
!123 = !DILocation(line: 92, column: 10, scope: !115)
!124 = !DILocation(line: 93, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !115, file: !16, line: 93, column: 8)
!126 = !DILocation(line: 93, column: 8, scope: !115)
!127 = !DILocation(line: 96, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !16, line: 94, column: 5)
!129 = !DILocation(line: 96, column: 9, scope: !128)
!130 = !DILocation(line: 97, column: 9, scope: !128)
!131 = !DILocation(line: 97, column: 20, scope: !128)
!132 = !DILocation(line: 98, column: 5, scope: !128)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !16, line: 100, type: !38)
!134 = distinct !DILexicalBlock(scope: !115, file: !16, line: 99, column: 5)
!135 = !DILocation(line: 100, column: 17, scope: !134)
!136 = !DILocation(line: 102, column: 9, scope: !134)
!137 = !DILocation(line: 102, column: 23, scope: !134)
!138 = !DILocation(line: 102, column: 36, scope: !134)
!139 = !DILocation(line: 102, column: 29, scope: !134)
!140 = !DILocation(line: 102, column: 41, scope: !134)
!141 = !DILocation(line: 103, column: 9, scope: !134)
!142 = !DILocation(line: 103, column: 20, scope: !134)
!143 = !DILocation(line: 104, column: 20, scope: !134)
!144 = !DILocation(line: 104, column: 9, scope: !134)
!145 = !DILocation(line: 106, column: 1, scope: !115)
