; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_31_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  store i32* %8, i32** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !39, metadata !DIExpression()), !dbg !41
  %9 = load i32*, i32** %data, align 8, !dbg !42
  store i32* %9, i32** %dataCopy, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !43, metadata !DIExpression()), !dbg !44
  %10 = load i32*, i32** %dataCopy, align 8, !dbg !45
  store i32* %10, i32** %data3, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !53
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx5, align 4, !dbg !55
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %11 = bitcast i32* %arraydecay6 to i8*, !dbg !56
  %12 = load i32*, i32** %data3, align 8, !dbg !57
  %13 = bitcast i32* %12 to i8*, !dbg !56
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call8 = call i64 @wcslen(i32* %arraydecay7) #7, !dbg !59
  %mul = mul i64 %call8, 4, !dbg !60
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %11, i8* align 4 %13, i64 %mul, i1 false), !dbg !56
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx9, align 4, !dbg !62
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* %arraydecay10), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_31_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
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
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_31_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_31_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 200, align 16, !dbg !94
  %1 = bitcast i8* %0 to i32*, !dbg !95
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %2 = alloca i8, i64 400, align 16, !dbg !98
  %3 = bitcast i8* %2 to i32*, !dbg !99
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !97
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !100
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !101
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !104
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !105
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !106
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !106
  store i32 0, i32* %arrayidx2, align 4, !dbg !107
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !108
  store i32* %8, i32** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !110, metadata !DIExpression()), !dbg !112
  %9 = load i32*, i32** %data, align 8, !dbg !113
  store i32* %9, i32** %dataCopy, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !114, metadata !DIExpression()), !dbg !115
  %10 = load i32*, i32** %dataCopy, align 8, !dbg !116
  store i32* %10, i32** %data3, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !121
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx5, align 4, !dbg !123
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  %11 = bitcast i32* %arraydecay6 to i8*, !dbg !124
  %12 = load i32*, i32** %data3, align 8, !dbg !125
  %13 = bitcast i32* %12 to i8*, !dbg !124
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  %call8 = call i64 @wcslen(i32* %arraydecay7) #7, !dbg !127
  %mul = mul i64 %call8, 4, !dbg !128
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %11, i8* align 4 %13, i64 %mul, i1 false), !dbg !124
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx9, align 4, !dbg !130
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !131
  call void @printWLine(i32* %arraydecay10), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_31_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_31.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 13, scope: !15)
!30 = !DILocation(line: 28, column: 5, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 29, column: 25, scope: !15)
!33 = !DILocation(line: 30, column: 13, scope: !15)
!34 = !DILocation(line: 30, column: 5, scope: !15)
!35 = !DILocation(line: 31, column: 5, scope: !15)
!36 = !DILocation(line: 31, column: 27, scope: !15)
!37 = !DILocation(line: 33, column: 12, scope: !15)
!38 = !DILocation(line: 33, column: 10, scope: !15)
!39 = !DILocalVariable(name: "dataCopy", scope: !40, file: !16, line: 35, type: !4)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!41 = !DILocation(line: 35, column: 19, scope: !40)
!42 = !DILocation(line: 35, column: 30, scope: !40)
!43 = !DILocalVariable(name: "data", scope: !40, file: !16, line: 36, type: !4)
!44 = !DILocation(line: 36, column: 19, scope: !40)
!45 = !DILocation(line: 36, column: 26, scope: !40)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !16, line: 38, type: !48)
!47 = distinct !DILexicalBlock(scope: !40, file: !16, line: 37, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 38, column: 21, scope: !47)
!52 = !DILocation(line: 39, column: 21, scope: !47)
!53 = !DILocation(line: 39, column: 13, scope: !47)
!54 = !DILocation(line: 40, column: 13, scope: !47)
!55 = !DILocation(line: 40, column: 25, scope: !47)
!56 = !DILocation(line: 43, column: 13, scope: !47)
!57 = !DILocation(line: 43, column: 27, scope: !47)
!58 = !DILocation(line: 43, column: 40, scope: !47)
!59 = !DILocation(line: 43, column: 33, scope: !47)
!60 = !DILocation(line: 43, column: 45, scope: !47)
!61 = !DILocation(line: 44, column: 13, scope: !47)
!62 = !DILocation(line: 44, column: 25, scope: !47)
!63 = !DILocation(line: 45, column: 24, scope: !47)
!64 = !DILocation(line: 45, column: 13, scope: !47)
!65 = !DILocation(line: 48, column: 1, scope: !15)
!66 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_31_good", scope: !16, file: !16, line: 82, type: !17, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 84, column: 5, scope: !66)
!68 = !DILocation(line: 85, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 96, type: !70, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!7, !7, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !16, line: 96, type: !7)
!76 = !DILocation(line: 96, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !16, line: 96, type: !72)
!78 = !DILocation(line: 96, column: 27, scope: !69)
!79 = !DILocation(line: 99, column: 22, scope: !69)
!80 = !DILocation(line: 99, column: 12, scope: !69)
!81 = !DILocation(line: 99, column: 5, scope: !69)
!82 = !DILocation(line: 101, column: 5, scope: !69)
!83 = !DILocation(line: 102, column: 5, scope: !69)
!84 = !DILocation(line: 103, column: 5, scope: !69)
!85 = !DILocation(line: 106, column: 5, scope: !69)
!86 = !DILocation(line: 107, column: 5, scope: !69)
!87 = !DILocation(line: 108, column: 5, scope: !69)
!88 = !DILocation(line: 110, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !16, line: 57, type: !4)
!91 = !DILocation(line: 57, column: 15, scope: !89)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !89, file: !16, line: 58, type: !4)
!93 = !DILocation(line: 58, column: 15, scope: !89)
!94 = !DILocation(line: 58, column: 42, scope: !89)
!95 = !DILocation(line: 58, column: 31, scope: !89)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !89, file: !16, line: 59, type: !4)
!97 = !DILocation(line: 59, column: 15, scope: !89)
!98 = !DILocation(line: 59, column: 43, scope: !89)
!99 = !DILocation(line: 59, column: 32, scope: !89)
!100 = !DILocation(line: 60, column: 13, scope: !89)
!101 = !DILocation(line: 60, column: 5, scope: !89)
!102 = !DILocation(line: 61, column: 5, scope: !89)
!103 = !DILocation(line: 61, column: 25, scope: !89)
!104 = !DILocation(line: 62, column: 13, scope: !89)
!105 = !DILocation(line: 62, column: 5, scope: !89)
!106 = !DILocation(line: 63, column: 5, scope: !89)
!107 = !DILocation(line: 63, column: 27, scope: !89)
!108 = !DILocation(line: 65, column: 12, scope: !89)
!109 = !DILocation(line: 65, column: 10, scope: !89)
!110 = !DILocalVariable(name: "dataCopy", scope: !111, file: !16, line: 67, type: !4)
!111 = distinct !DILexicalBlock(scope: !89, file: !16, line: 66, column: 5)
!112 = !DILocation(line: 67, column: 19, scope: !111)
!113 = !DILocation(line: 67, column: 30, scope: !111)
!114 = !DILocalVariable(name: "data", scope: !111, file: !16, line: 68, type: !4)
!115 = !DILocation(line: 68, column: 19, scope: !111)
!116 = !DILocation(line: 68, column: 26, scope: !111)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !16, line: 70, type: !48)
!118 = distinct !DILexicalBlock(scope: !111, file: !16, line: 69, column: 9)
!119 = !DILocation(line: 70, column: 21, scope: !118)
!120 = !DILocation(line: 71, column: 21, scope: !118)
!121 = !DILocation(line: 71, column: 13, scope: !118)
!122 = !DILocation(line: 72, column: 13, scope: !118)
!123 = !DILocation(line: 72, column: 25, scope: !118)
!124 = !DILocation(line: 75, column: 13, scope: !118)
!125 = !DILocation(line: 75, column: 27, scope: !118)
!126 = !DILocation(line: 75, column: 40, scope: !118)
!127 = !DILocation(line: 75, column: 33, scope: !118)
!128 = !DILocation(line: 75, column: 45, scope: !118)
!129 = !DILocation(line: 76, column: 13, scope: !118)
!130 = !DILocation(line: 76, column: 25, scope: !118)
!131 = !DILocation(line: 77, column: 24, scope: !118)
!132 = !DILocation(line: 77, column: 13, scope: !118)
!133 = !DILocation(line: 80, column: 1, scope: !89)
