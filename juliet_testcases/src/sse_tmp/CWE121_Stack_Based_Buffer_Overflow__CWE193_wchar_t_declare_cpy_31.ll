; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_31_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %1, i32** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !39, metadata !DIExpression()), !dbg !40
  %2 = load i32*, i32** %dataCopy, align 8, !dbg !41
  store i32* %2, i32** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_31_bad.source to i8*), i64 44, i1 false), !dbg !44
  %4 = load i32*, i32** %data1, align 8, !dbg !45
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %call = call i32* @wcscpy(i32* %4, i32* %arraydecay2) #5, !dbg !47
  %5 = load i32*, i32** %data1, align 8, !dbg !48
  call void @printWLine(i32* %5), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_31_good() #0 !dbg !51 {
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
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_31_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_31_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !81
  store i32* %arraydecay, i32** %data, align 8, !dbg !82
  %0 = load i32*, i32** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !85, metadata !DIExpression()), !dbg !87
  %1 = load i32*, i32** %data, align 8, !dbg !88
  store i32* %1, i32** %dataCopy, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !89, metadata !DIExpression()), !dbg !90
  %2 = load i32*, i32** %dataCopy, align 8, !dbg !91
  store i32* %2, i32** %data1, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !94
  %4 = load i32*, i32** %data1, align 8, !dbg !95
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !96
  %call = call i32* @wcscpy(i32* %4, i32* %arraydecay2) #5, !dbg !97
  %5 = load i32*, i32** %data1, align 8, !dbg !98
  call void @printWLine(i32* %5), !dbg !99
  ret void, !dbg !100
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_31_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_31.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 31, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 32, column: 13, scope: !11)
!31 = !DILocation(line: 35, column: 12, scope: !11)
!32 = !DILocation(line: 35, column: 10, scope: !11)
!33 = !DILocation(line: 36, column: 5, scope: !11)
!34 = !DILocation(line: 36, column: 13, scope: !11)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !12, line: 38, type: !16)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!37 = !DILocation(line: 38, column: 19, scope: !36)
!38 = !DILocation(line: 38, column: 30, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 39, type: !16)
!40 = !DILocation(line: 39, column: 19, scope: !36)
!41 = !DILocation(line: 39, column: 26, scope: !36)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 41, type: !27)
!43 = distinct !DILexicalBlock(scope: !36, file: !12, line: 40, column: 9)
!44 = !DILocation(line: 41, column: 21, scope: !43)
!45 = !DILocation(line: 43, column: 20, scope: !43)
!46 = !DILocation(line: 43, column: 26, scope: !43)
!47 = !DILocation(line: 43, column: 13, scope: !43)
!48 = !DILocation(line: 44, column: 24, scope: !43)
!49 = !DILocation(line: 44, column: 13, scope: !43)
!50 = !DILocation(line: 47, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_31_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 77, column: 5, scope: !51)
!53 = !DILocation(line: 78, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !55, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!19, !19, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 89, type: !19)
!61 = !DILocation(line: 89, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 89, type: !57)
!63 = !DILocation(line: 89, column: 27, scope: !54)
!64 = !DILocation(line: 92, column: 22, scope: !54)
!65 = !DILocation(line: 92, column: 12, scope: !54)
!66 = !DILocation(line: 92, column: 5, scope: !54)
!67 = !DILocation(line: 94, column: 5, scope: !54)
!68 = !DILocation(line: 95, column: 5, scope: !54)
!69 = !DILocation(line: 96, column: 5, scope: !54)
!70 = !DILocation(line: 99, column: 5, scope: !54)
!71 = !DILocation(line: 100, column: 5, scope: !54)
!72 = !DILocation(line: 101, column: 5, scope: !54)
!73 = !DILocation(line: 103, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 56, type: !16)
!76 = !DILocation(line: 56, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !12, line: 57, type: !22)
!78 = !DILocation(line: 57, column: 13, scope: !74)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !12, line: 58, type: !27)
!80 = !DILocation(line: 58, column: 13, scope: !74)
!81 = !DILocation(line: 61, column: 12, scope: !74)
!82 = !DILocation(line: 61, column: 10, scope: !74)
!83 = !DILocation(line: 62, column: 5, scope: !74)
!84 = !DILocation(line: 62, column: 13, scope: !74)
!85 = !DILocalVariable(name: "dataCopy", scope: !86, file: !12, line: 64, type: !16)
!86 = distinct !DILexicalBlock(scope: !74, file: !12, line: 63, column: 5)
!87 = !DILocation(line: 64, column: 19, scope: !86)
!88 = !DILocation(line: 64, column: 30, scope: !86)
!89 = !DILocalVariable(name: "data", scope: !86, file: !12, line: 65, type: !16)
!90 = !DILocation(line: 65, column: 19, scope: !86)
!91 = !DILocation(line: 65, column: 26, scope: !86)
!92 = !DILocalVariable(name: "source", scope: !93, file: !12, line: 67, type: !27)
!93 = distinct !DILexicalBlock(scope: !86, file: !12, line: 66, column: 9)
!94 = !DILocation(line: 67, column: 21, scope: !93)
!95 = !DILocation(line: 69, column: 20, scope: !93)
!96 = !DILocation(line: 69, column: 26, scope: !93)
!97 = !DILocation(line: 69, column: 13, scope: !93)
!98 = !DILocation(line: 70, column: 24, scope: !93)
!99 = !DILocation(line: 70, column: 13, scope: !93)
!100 = !DILocation(line: 73, column: 1, scope: !74)
