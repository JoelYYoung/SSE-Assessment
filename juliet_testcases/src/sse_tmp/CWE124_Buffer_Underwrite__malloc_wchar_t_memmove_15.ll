; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %dataBuffer, align 8, !dbg !25
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx3, align 4, !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  %6 = bitcast i32* %5 to i8*, !dbg !52
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !52
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !52
  %8 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !53
  store i32 0, i32* %arrayidx5, align 4, !dbg !54
  %9 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %9), !dbg !56
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

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_15_good() #0 !dbg !58 {
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
  %call = call i64 @time(i64* null) #6, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #6, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_15_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_15_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !89
  %0 = bitcast i8* %call to i32*, !dbg !90
  store i32* %0, i32** %dataBuffer, align 8, !dbg !88
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  %cmp = icmp eq i32* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !97
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !98
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !101
  store i32* %4, i32** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !107
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx3, align 4, !dbg !109
  %5 = load i32*, i32** %data, align 8, !dbg !110
  %6 = bitcast i32* %5 to i8*, !dbg !111
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !111
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !111
  %8 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !112
  store i32 0, i32* %arrayidx5, align 4, !dbg !113
  %9 = load i32*, i32** %data, align 8, !dbg !114
  call void @printWLine(i32* %9), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i32* null, i32** %data, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !121, metadata !DIExpression()), !dbg !123
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !124
  %0 = bitcast i8* %call to i32*, !dbg !125
  store i32* %0, i32** %dataBuffer, align 8, !dbg !123
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !126
  %cmp = icmp eq i32* %1, null, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !132
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !133
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !136
  store i32* %4, i32** %data, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !138, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !141
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !142
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !143
  store i32 0, i32* %arrayidx3, align 4, !dbg !144
  %5 = load i32*, i32** %data, align 8, !dbg !145
  %6 = bitcast i32* %5 to i8*, !dbg !146
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !146
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !146
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !146
  %8 = load i32*, i32** %data, align 8, !dbg !147
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !147
  store i32 0, i32* %arrayidx5, align 4, !dbg !148
  %9 = load i32*, i32** %data, align 8, !dbg !149
  call void @printWLine(i32* %9), !dbg !150
  ret void, !dbg !151
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_15_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 31, type: !4)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 30, column: 5)
!25 = !DILocation(line: 31, column: 19, scope: !24)
!26 = !DILocation(line: 31, column: 43, scope: !24)
!27 = !DILocation(line: 31, column: 32, scope: !24)
!28 = !DILocation(line: 32, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 32, column: 13)
!30 = !DILocation(line: 32, column: 24, scope: !29)
!31 = !DILocation(line: 32, column: 13, scope: !24)
!32 = !DILocation(line: 32, column: 34, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 32, column: 33)
!34 = !DILocation(line: 33, column: 17, scope: !24)
!35 = !DILocation(line: 33, column: 9, scope: !24)
!36 = !DILocation(line: 34, column: 9, scope: !24)
!37 = !DILocation(line: 34, column: 27, scope: !24)
!38 = !DILocation(line: 36, column: 16, scope: !24)
!39 = !DILocation(line: 36, column: 27, scope: !24)
!40 = !DILocation(line: 36, column: 14, scope: !24)
!41 = !DILocalVariable(name: "source", scope: !42, file: !17, line: 45, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 44, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 45, column: 17, scope: !42)
!47 = !DILocation(line: 46, column: 17, scope: !42)
!48 = !DILocation(line: 46, column: 9, scope: !42)
!49 = !DILocation(line: 47, column: 9, scope: !42)
!50 = !DILocation(line: 47, column: 23, scope: !42)
!51 = !DILocation(line: 49, column: 17, scope: !42)
!52 = !DILocation(line: 49, column: 9, scope: !42)
!53 = !DILocation(line: 51, column: 9, scope: !42)
!54 = !DILocation(line: 51, column: 21, scope: !42)
!55 = !DILocation(line: 52, column: 20, scope: !42)
!56 = !DILocation(line: 52, column: 9, scope: !42)
!57 = !DILocation(line: 56, column: 1, scope: !16)
!58 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_15_good", scope: !17, file: !17, line: 134, type: !18, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 136, column: 5, scope: !58)
!60 = !DILocation(line: 137, column: 5, scope: !58)
!61 = !DILocation(line: 138, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 150, type: !63, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!7, !7, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !17, line: 150, type: !7)
!69 = !DILocation(line: 150, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !17, line: 150, type: !65)
!71 = !DILocation(line: 150, column: 27, scope: !62)
!72 = !DILocation(line: 153, column: 22, scope: !62)
!73 = !DILocation(line: 153, column: 12, scope: !62)
!74 = !DILocation(line: 153, column: 5, scope: !62)
!75 = !DILocation(line: 155, column: 5, scope: !62)
!76 = !DILocation(line: 156, column: 5, scope: !62)
!77 = !DILocation(line: 157, column: 5, scope: !62)
!78 = !DILocation(line: 160, column: 5, scope: !62)
!79 = !DILocation(line: 161, column: 5, scope: !62)
!80 = !DILocation(line: 162, column: 5, scope: !62)
!81 = !DILocation(line: 164, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 63, type: !18, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !17, line: 65, type: !4)
!84 = !DILocation(line: 65, column: 15, scope: !82)
!85 = !DILocation(line: 66, column: 10, scope: !82)
!86 = !DILocalVariable(name: "dataBuffer", scope: !87, file: !17, line: 75, type: !4)
!87 = distinct !DILexicalBlock(scope: !82, file: !17, line: 74, column: 5)
!88 = !DILocation(line: 75, column: 19, scope: !87)
!89 = !DILocation(line: 75, column: 43, scope: !87)
!90 = !DILocation(line: 75, column: 32, scope: !87)
!91 = !DILocation(line: 76, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !17, line: 76, column: 13)
!93 = !DILocation(line: 76, column: 24, scope: !92)
!94 = !DILocation(line: 76, column: 13, scope: !87)
!95 = !DILocation(line: 76, column: 34, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !17, line: 76, column: 33)
!97 = !DILocation(line: 77, column: 17, scope: !87)
!98 = !DILocation(line: 77, column: 9, scope: !87)
!99 = !DILocation(line: 78, column: 9, scope: !87)
!100 = !DILocation(line: 78, column: 27, scope: !87)
!101 = !DILocation(line: 80, column: 16, scope: !87)
!102 = !DILocation(line: 80, column: 14, scope: !87)
!103 = !DILocalVariable(name: "source", scope: !104, file: !17, line: 85, type: !43)
!104 = distinct !DILexicalBlock(scope: !82, file: !17, line: 84, column: 5)
!105 = !DILocation(line: 85, column: 17, scope: !104)
!106 = !DILocation(line: 86, column: 17, scope: !104)
!107 = !DILocation(line: 86, column: 9, scope: !104)
!108 = !DILocation(line: 87, column: 9, scope: !104)
!109 = !DILocation(line: 87, column: 23, scope: !104)
!110 = !DILocation(line: 89, column: 17, scope: !104)
!111 = !DILocation(line: 89, column: 9, scope: !104)
!112 = !DILocation(line: 91, column: 9, scope: !104)
!113 = !DILocation(line: 91, column: 21, scope: !104)
!114 = !DILocation(line: 92, column: 20, scope: !104)
!115 = !DILocation(line: 92, column: 9, scope: !104)
!116 = !DILocation(line: 96, column: 1, scope: !82)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 99, type: !18, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !17, line: 101, type: !4)
!119 = !DILocation(line: 101, column: 15, scope: !117)
!120 = !DILocation(line: 102, column: 10, scope: !117)
!121 = !DILocalVariable(name: "dataBuffer", scope: !122, file: !17, line: 107, type: !4)
!122 = distinct !DILexicalBlock(scope: !117, file: !17, line: 106, column: 5)
!123 = !DILocation(line: 107, column: 19, scope: !122)
!124 = !DILocation(line: 107, column: 43, scope: !122)
!125 = !DILocation(line: 107, column: 32, scope: !122)
!126 = !DILocation(line: 108, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !17, line: 108, column: 13)
!128 = !DILocation(line: 108, column: 24, scope: !127)
!129 = !DILocation(line: 108, column: 13, scope: !122)
!130 = !DILocation(line: 108, column: 34, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !17, line: 108, column: 33)
!132 = !DILocation(line: 109, column: 17, scope: !122)
!133 = !DILocation(line: 109, column: 9, scope: !122)
!134 = !DILocation(line: 110, column: 9, scope: !122)
!135 = !DILocation(line: 110, column: 27, scope: !122)
!136 = !DILocation(line: 112, column: 16, scope: !122)
!137 = !DILocation(line: 112, column: 14, scope: !122)
!138 = !DILocalVariable(name: "source", scope: !139, file: !17, line: 121, type: !43)
!139 = distinct !DILexicalBlock(scope: !117, file: !17, line: 120, column: 5)
!140 = !DILocation(line: 121, column: 17, scope: !139)
!141 = !DILocation(line: 122, column: 17, scope: !139)
!142 = !DILocation(line: 122, column: 9, scope: !139)
!143 = !DILocation(line: 123, column: 9, scope: !139)
!144 = !DILocation(line: 123, column: 23, scope: !139)
!145 = !DILocation(line: 125, column: 17, scope: !139)
!146 = !DILocation(line: 125, column: 9, scope: !139)
!147 = !DILocation(line: 127, column: 9, scope: !139)
!148 = !DILocation(line: 127, column: 21, scope: !139)
!149 = !DILocation(line: 128, column: 20, scope: !139)
!150 = !DILocation(line: 128, column: 9, scope: !139)
!151 = !DILocation(line: 132, column: 1, scope: !117)
