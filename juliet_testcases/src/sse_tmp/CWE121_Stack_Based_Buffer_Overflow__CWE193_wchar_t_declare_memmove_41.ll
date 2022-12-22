; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_badSink(i32* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_badSink.source to i8*), i64 44, i1 false), !dbg !26
  %1 = load i32*, i32** %data.addr, align 8, !dbg !27
  %2 = bitcast i32* %1 to i8*, !dbg !28
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !28
  %3 = bitcast i32* %arraydecay to i8*, !dbg !28
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !29
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !30
  %add = add i64 %call, 1, !dbg !31
  %mul = mul i64 %add, 4, !dbg !32
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 %mul, i1 false), !dbg !28
  %4 = load i32*, i32** %data.addr, align 8, !dbg !33
  call void @printWLine(i32* %4), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_bad() #0 !dbg !36 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !46, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !48
  store i32* %arraydecay, i32** %data, align 8, !dbg !49
  %0 = load i32*, i32** %data, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  %1 = load i32*, i32** %data, align 8, !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_badSink(i32* %1), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_goodG2BSink(i32* %data) #0 !dbg !55 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !58, metadata !DIExpression()), !dbg !60
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !60
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !60
  %1 = load i32*, i32** %data.addr, align 8, !dbg !61
  %2 = bitcast i32* %1 to i8*, !dbg !62
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !62
  %3 = bitcast i32* %arraydecay to i8*, !dbg !62
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !63
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !64
  %add = add i64 %call, 1, !dbg !65
  %mul = mul i64 %add, 4, !dbg !66
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 %mul, i1 false), !dbg !62
  %4 = load i32*, i32** %data.addr, align 8, !dbg !67
  call void @printWLine(i32* %4), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #7, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #7, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !100
  store i32* %arraydecay, i32** %data, align 8, !dbg !101
  %0 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %1 = load i32*, i32** %data, align 8, !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_goodG2BSink(i32* %1), !dbg !105
  ret void, !dbg !106
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_badSink", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 28, type: !15)
!20 = !DILocation(line: 28, column: 94, scope: !11)
!21 = !DILocalVariable(name: "source", scope: !22, file: !12, line: 31, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 352, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 11)
!26 = !DILocation(line: 31, column: 17, scope: !22)
!27 = !DILocation(line: 34, column: 17, scope: !22)
!28 = !DILocation(line: 34, column: 9, scope: !22)
!29 = !DILocation(line: 34, column: 39, scope: !22)
!30 = !DILocation(line: 34, column: 32, scope: !22)
!31 = !DILocation(line: 34, column: 47, scope: !22)
!32 = !DILocation(line: 34, column: 52, scope: !22)
!33 = !DILocation(line: 35, column: 20, scope: !22)
!34 = !DILocation(line: 35, column: 9, scope: !22)
!35 = !DILocation(line: 37, column: 1, scope: !11)
!36 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_bad", scope: !12, file: !12, line: 39, type: !37, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 41, type: !15)
!40 = !DILocation(line: 41, column: 15, scope: !36)
!41 = !DILocalVariable(name: "dataBadBuffer", scope: !36, file: !12, line: 42, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 10)
!45 = !DILocation(line: 42, column: 13, scope: !36)
!46 = !DILocalVariable(name: "dataGoodBuffer", scope: !36, file: !12, line: 43, type: !23)
!47 = !DILocation(line: 43, column: 13, scope: !36)
!48 = !DILocation(line: 46, column: 12, scope: !36)
!49 = !DILocation(line: 46, column: 10, scope: !36)
!50 = !DILocation(line: 47, column: 5, scope: !36)
!51 = !DILocation(line: 47, column: 13, scope: !36)
!52 = !DILocation(line: 48, column: 83, scope: !36)
!53 = !DILocation(line: 48, column: 5, scope: !36)
!54 = !DILocation(line: 49, column: 1, scope: !36)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_goodG2BSink", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "data", arg: 1, scope: !55, file: !12, line: 55, type: !15)
!57 = !DILocation(line: 55, column: 98, scope: !55)
!58 = !DILocalVariable(name: "source", scope: !59, file: !12, line: 58, type: !23)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 57, column: 5)
!60 = !DILocation(line: 58, column: 17, scope: !59)
!61 = !DILocation(line: 61, column: 17, scope: !59)
!62 = !DILocation(line: 61, column: 9, scope: !59)
!63 = !DILocation(line: 61, column: 39, scope: !59)
!64 = !DILocation(line: 61, column: 32, scope: !59)
!65 = !DILocation(line: 61, column: 47, scope: !59)
!66 = !DILocation(line: 61, column: 52, scope: !59)
!67 = !DILocation(line: 62, column: 20, scope: !59)
!68 = !DILocation(line: 62, column: 9, scope: !59)
!69 = !DILocation(line: 64, column: 1, scope: !55)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_41_good", scope: !12, file: !12, line: 79, type: !37, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 81, column: 5, scope: !70)
!72 = !DILocation(line: 82, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !74, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!18, !18, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 94, type: !18)
!80 = !DILocation(line: 94, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 94, type: !76)
!82 = !DILocation(line: 94, column: 27, scope: !73)
!83 = !DILocation(line: 97, column: 22, scope: !73)
!84 = !DILocation(line: 97, column: 12, scope: !73)
!85 = !DILocation(line: 97, column: 5, scope: !73)
!86 = !DILocation(line: 99, column: 5, scope: !73)
!87 = !DILocation(line: 100, column: 5, scope: !73)
!88 = !DILocation(line: 101, column: 5, scope: !73)
!89 = !DILocation(line: 104, column: 5, scope: !73)
!90 = !DILocation(line: 105, column: 5, scope: !73)
!91 = !DILocation(line: 106, column: 5, scope: !73)
!92 = !DILocation(line: 108, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !37, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 69, type: !15)
!95 = !DILocation(line: 69, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !12, line: 70, type: !42)
!97 = !DILocation(line: 70, column: 13, scope: !93)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !12, line: 71, type: !23)
!99 = !DILocation(line: 71, column: 13, scope: !93)
!100 = !DILocation(line: 74, column: 12, scope: !93)
!101 = !DILocation(line: 74, column: 10, scope: !93)
!102 = !DILocation(line: 75, column: 5, scope: !93)
!103 = !DILocation(line: 75, column: 13, scope: !93)
!104 = !DILocation(line: 76, column: 87, scope: !93)
!105 = !DILocation(line: 76, column: 5, scope: !93)
!106 = !DILocation(line: 77, column: 1, scope: !93)
