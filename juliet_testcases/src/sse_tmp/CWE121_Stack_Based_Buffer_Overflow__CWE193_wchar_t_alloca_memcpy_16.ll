; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_16_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_16_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  br label %while.body, !dbg !29

while.body:                                       ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !30
  store i32* %4, i32** %data, align 8, !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  br label %while.end, !dbg !35

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_16_bad.source to i8*), i64 44, i1 false), !dbg !41
  %7 = load i32*, i32** %data, align 8, !dbg !42
  %8 = bitcast i32* %7 to i8*, !dbg !43
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !43
  %9 = bitcast i32* %arraydecay to i8*, !dbg !43
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !44
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !45
  %add = add i64 %call, 1, !dbg !46
  %mul = mul i64 %add, 4, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !43
  %10 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %10), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_16_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_16_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_16_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 40, align 16, !dbg !79
  %1 = bitcast i8* %0 to i32*, !dbg !80
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %2 = alloca i8, i64 44, align 16, !dbg !83
  %3 = bitcast i8* %2 to i32*, !dbg !84
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !82
  br label %while.body, !dbg !85

while.body:                                       ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !86
  store i32* %4, i32** %data, align 8, !dbg !88
  %5 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  br label %while.end, !dbg !91

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !94
  %7 = load i32*, i32** %data, align 8, !dbg !95
  %8 = bitcast i32* %7 to i8*, !dbg !96
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !96
  %9 = bitcast i32* %arraydecay to i8*, !dbg !96
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !97
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !98
  %add = add i64 %call, 1, !dbg !99
  %mul = mul i64 %add, 4, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !96
  %10 = load i32*, i32** %data, align 8, !dbg !101
  call void @printWLine(i32* %10), !dbg !102
  ret void, !dbg !103
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_16.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_16_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_16.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocation(line: 31, column: 42, scope: !15)
!24 = !DILocation(line: 31, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !4)
!26 = !DILocation(line: 32, column: 15, scope: !15)
!27 = !DILocation(line: 32, column: 43, scope: !15)
!28 = !DILocation(line: 32, column: 32, scope: !15)
!29 = !DILocation(line: 33, column: 5, scope: !15)
!30 = !DILocation(line: 37, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!32 = !DILocation(line: 37, column: 14, scope: !31)
!33 = !DILocation(line: 38, column: 9, scope: !31)
!34 = !DILocation(line: 38, column: 17, scope: !31)
!35 = !DILocation(line: 39, column: 9, scope: !31)
!36 = !DILocalVariable(name: "source", scope: !37, file: !16, line: 42, type: !38)
!37 = distinct !DILexicalBlock(scope: !15, file: !16, line: 41, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 11)
!41 = !DILocation(line: 42, column: 17, scope: !37)
!42 = !DILocation(line: 45, column: 16, scope: !37)
!43 = !DILocation(line: 45, column: 9, scope: !37)
!44 = !DILocation(line: 45, column: 38, scope: !37)
!45 = !DILocation(line: 45, column: 31, scope: !37)
!46 = !DILocation(line: 45, column: 46, scope: !37)
!47 = !DILocation(line: 45, column: 51, scope: !37)
!48 = !DILocation(line: 46, column: 20, scope: !37)
!49 = !DILocation(line: 46, column: 9, scope: !37)
!50 = !DILocation(line: 48, column: 1, scope: !15)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_16_good", scope: !16, file: !16, line: 77, type: !17, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 79, column: 5, scope: !51)
!53 = !DILocation(line: 80, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 92, type: !55, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !16, line: 92, type: !7)
!61 = !DILocation(line: 92, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !16, line: 92, type: !57)
!63 = !DILocation(line: 92, column: 27, scope: !54)
!64 = !DILocation(line: 95, column: 22, scope: !54)
!65 = !DILocation(line: 95, column: 12, scope: !54)
!66 = !DILocation(line: 95, column: 5, scope: !54)
!67 = !DILocation(line: 97, column: 5, scope: !54)
!68 = !DILocation(line: 98, column: 5, scope: !54)
!69 = !DILocation(line: 99, column: 5, scope: !54)
!70 = !DILocation(line: 102, column: 5, scope: !54)
!71 = !DILocation(line: 103, column: 5, scope: !54)
!72 = !DILocation(line: 104, column: 5, scope: !54)
!73 = !DILocation(line: 106, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !16, line: 57, type: !4)
!76 = !DILocation(line: 57, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !16, line: 58, type: !4)
!78 = !DILocation(line: 58, column: 15, scope: !74)
!79 = !DILocation(line: 58, column: 42, scope: !74)
!80 = !DILocation(line: 58, column: 31, scope: !74)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !16, line: 59, type: !4)
!82 = !DILocation(line: 59, column: 15, scope: !74)
!83 = !DILocation(line: 59, column: 43, scope: !74)
!84 = !DILocation(line: 59, column: 32, scope: !74)
!85 = !DILocation(line: 60, column: 5, scope: !74)
!86 = !DILocation(line: 64, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !74, file: !16, line: 61, column: 5)
!88 = !DILocation(line: 64, column: 14, scope: !87)
!89 = !DILocation(line: 65, column: 9, scope: !87)
!90 = !DILocation(line: 65, column: 17, scope: !87)
!91 = !DILocation(line: 66, column: 9, scope: !87)
!92 = !DILocalVariable(name: "source", scope: !93, file: !16, line: 69, type: !38)
!93 = distinct !DILexicalBlock(scope: !74, file: !16, line: 68, column: 5)
!94 = !DILocation(line: 69, column: 17, scope: !93)
!95 = !DILocation(line: 72, column: 16, scope: !93)
!96 = !DILocation(line: 72, column: 9, scope: !93)
!97 = !DILocation(line: 72, column: 38, scope: !93)
!98 = !DILocation(line: 72, column: 31, scope: !93)
!99 = !DILocation(line: 72, column: 46, scope: !93)
!100 = !DILocation(line: 72, column: 51, scope: !93)
!101 = !DILocation(line: 73, column: 20, scope: !93)
!102 = !DILocation(line: 73, column: 9, scope: !93)
!103 = !DILocation(line: 75, column: 1, scope: !74)
