; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  %0 = load i32, i32* @staticFive, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #7, !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !46
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !47
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  %6 = bitcast i32* %5 to i8*, !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !49
  %call2 = call i64 @wcslen(i32* %7) #8, !dbg !50
  %mul = mul i64 %call2, 4, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !47
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !52
  store i32 0, i32* %arrayidx3, align 4, !dbg !53
  %8 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* %8), !dbg !55
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_07_good() #0 !dbg !57 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_07_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_07_bad(), !dbg !78
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
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !86
  store i32* %arraydecay, i32** %data, align 8, !dbg !87
  %0 = load i32, i32* @staticFive, align 4, !dbg !88
  %cmp = icmp ne i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !97
  %2 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !102
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !103
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !103
  %5 = load i32*, i32** %data, align 8, !dbg !104
  %6 = bitcast i32* %5 to i8*, !dbg !103
  %7 = load i32*, i32** %data, align 8, !dbg !105
  %call2 = call i64 @wcslen(i32* %7) #8, !dbg !106
  %mul = mul i64 %call2, 4, !dbg !107
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !103
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !108
  store i32 0, i32* %arrayidx3, align 4, !dbg !109
  %8 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* %8), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !118
  store i32* %arraydecay, i32** %data, align 8, !dbg !119
  %0 = load i32, i32* @staticFive, align 4, !dbg !120
  %cmp = icmp eq i32 %0, 5, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !124
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !126
  %2 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !132
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !133
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !133
  %5 = load i32*, i32** %data, align 8, !dbg !134
  %6 = bitcast i32* %5 to i8*, !dbg !133
  %7 = load i32*, i32** %data, align 8, !dbg !135
  %call2 = call i64 @wcslen(i32* %7) #8, !dbg !136
  %mul = mul i64 %call2, 4, !dbg !137
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !133
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !138
  store i32 0, i32* %arrayidx3, align 4, !dbg !139
  %8 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* %8), !dbg !141
  ret void, !dbg !142
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
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 32, column: 13, scope: !16)
!29 = !DILocation(line: 33, column: 12, scope: !16)
!30 = !DILocation(line: 33, column: 10, scope: !16)
!31 = !DILocation(line: 34, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !8, line: 34, column: 8)
!33 = !DILocation(line: 34, column: 18, scope: !32)
!34 = !DILocation(line: 34, column: 8, scope: !16)
!35 = !DILocation(line: 37, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !8, line: 35, column: 5)
!37 = !DILocation(line: 37, column: 9, scope: !36)
!38 = !DILocation(line: 38, column: 9, scope: !36)
!39 = !DILocation(line: 38, column: 21, scope: !36)
!40 = !DILocation(line: 39, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !8, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 41, column: 17, scope: !42)
!47 = !DILocation(line: 43, column: 9, scope: !42)
!48 = !DILocation(line: 43, column: 23, scope: !42)
!49 = !DILocation(line: 43, column: 36, scope: !42)
!50 = !DILocation(line: 43, column: 29, scope: !42)
!51 = !DILocation(line: 43, column: 41, scope: !42)
!52 = !DILocation(line: 44, column: 9, scope: !42)
!53 = !DILocation(line: 44, column: 20, scope: !42)
!54 = !DILocation(line: 45, column: 20, scope: !42)
!55 = !DILocation(line: 45, column: 9, scope: !42)
!56 = !DILocation(line: 47, column: 1, scope: !16)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_07_good", scope: !8, file: !8, line: 100, type: !17, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 102, column: 5, scope: !57)
!59 = !DILocation(line: 103, column: 5, scope: !57)
!60 = !DILocation(line: 104, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 116, type: !62, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!9, !9, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !8, line: 116, type: !9)
!68 = !DILocation(line: 116, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !8, line: 116, type: !64)
!70 = !DILocation(line: 116, column: 27, scope: !61)
!71 = !DILocation(line: 119, column: 22, scope: !61)
!72 = !DILocation(line: 119, column: 12, scope: !61)
!73 = !DILocation(line: 119, column: 5, scope: !61)
!74 = !DILocation(line: 121, column: 5, scope: !61)
!75 = !DILocation(line: 122, column: 5, scope: !61)
!76 = !DILocation(line: 123, column: 5, scope: !61)
!77 = !DILocation(line: 126, column: 5, scope: !61)
!78 = !DILocation(line: 127, column: 5, scope: !61)
!79 = !DILocation(line: 128, column: 5, scope: !61)
!80 = !DILocation(line: 130, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !8, line: 56, type: !20)
!83 = !DILocation(line: 56, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !8, line: 57, type: !25)
!85 = !DILocation(line: 57, column: 13, scope: !81)
!86 = !DILocation(line: 58, column: 12, scope: !81)
!87 = !DILocation(line: 58, column: 10, scope: !81)
!88 = !DILocation(line: 59, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !81, file: !8, line: 59, column: 8)
!90 = !DILocation(line: 59, column: 18, scope: !89)
!91 = !DILocation(line: 59, column: 8, scope: !81)
!92 = !DILocation(line: 62, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !8, line: 60, column: 5)
!94 = !DILocation(line: 63, column: 5, scope: !93)
!95 = !DILocation(line: 67, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !8, line: 65, column: 5)
!97 = !DILocation(line: 67, column: 9, scope: !96)
!98 = !DILocation(line: 68, column: 9, scope: !96)
!99 = !DILocation(line: 68, column: 20, scope: !96)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !8, line: 71, type: !43)
!101 = distinct !DILexicalBlock(scope: !81, file: !8, line: 70, column: 5)
!102 = !DILocation(line: 71, column: 17, scope: !101)
!103 = !DILocation(line: 73, column: 9, scope: !101)
!104 = !DILocation(line: 73, column: 23, scope: !101)
!105 = !DILocation(line: 73, column: 36, scope: !101)
!106 = !DILocation(line: 73, column: 29, scope: !101)
!107 = !DILocation(line: 73, column: 41, scope: !101)
!108 = !DILocation(line: 74, column: 9, scope: !101)
!109 = !DILocation(line: 74, column: 20, scope: !101)
!110 = !DILocation(line: 75, column: 20, scope: !101)
!111 = !DILocation(line: 75, column: 9, scope: !101)
!112 = !DILocation(line: 77, column: 1, scope: !81)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocalVariable(name: "data", scope: !113, file: !8, line: 82, type: !20)
!115 = !DILocation(line: 82, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataBuffer", scope: !113, file: !8, line: 83, type: !25)
!117 = !DILocation(line: 83, column: 13, scope: !113)
!118 = !DILocation(line: 84, column: 12, scope: !113)
!119 = !DILocation(line: 84, column: 10, scope: !113)
!120 = !DILocation(line: 85, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !113, file: !8, line: 85, column: 8)
!122 = !DILocation(line: 85, column: 18, scope: !121)
!123 = !DILocation(line: 85, column: 8, scope: !113)
!124 = !DILocation(line: 88, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !8, line: 86, column: 5)
!126 = !DILocation(line: 88, column: 9, scope: !125)
!127 = !DILocation(line: 89, column: 9, scope: !125)
!128 = !DILocation(line: 89, column: 20, scope: !125)
!129 = !DILocation(line: 90, column: 5, scope: !125)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !8, line: 92, type: !43)
!131 = distinct !DILexicalBlock(scope: !113, file: !8, line: 91, column: 5)
!132 = !DILocation(line: 92, column: 17, scope: !131)
!133 = !DILocation(line: 94, column: 9, scope: !131)
!134 = !DILocation(line: 94, column: 23, scope: !131)
!135 = !DILocation(line: 94, column: 36, scope: !131)
!136 = !DILocation(line: 94, column: 29, scope: !131)
!137 = !DILocation(line: 94, column: 41, scope: !131)
!138 = !DILocation(line: 95, column: 9, scope: !131)
!139 = !DILocation(line: 95, column: 20, scope: !131)
!140 = !DILocation(line: 96, column: 20, scope: !131)
!141 = !DILocation(line: 96, column: 9, scope: !131)
!142 = !DILocation(line: 98, column: 1, scope: !113)
