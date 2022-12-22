; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  store i32* %2, i32** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !38
  store i32* %3, i32** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !44
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !45
  %5 = load i32*, i32** %data1, align 8, !dbg !46
  %6 = load i32*, i32** %data1, align 8, !dbg !47
  %call3 = call i64 @wcslen(i32* %6) #7, !dbg !48
  %call4 = call i32* @wcsncat(i32* %arraydecay2, i32* %5, i64 %call3) #6, !dbg !49
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !50
  store i32 0, i32* %arrayidx5, align 4, !dbg !51
  %7 = load i32*, i32** %data1, align 8, !dbg !52
  call void @printWLine(i32* %7), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncat(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_31_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_31_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_31_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !83
  store i32* %arraydecay, i32** %data, align 8, !dbg !84
  %0 = load i32*, i32** %data, align 8, !dbg !85
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !86
  %1 = load i32*, i32** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !89, metadata !DIExpression()), !dbg !91
  %2 = load i32*, i32** %data, align 8, !dbg !92
  store i32* %2, i32** %dataCopy, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !93, metadata !DIExpression()), !dbg !94
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !95
  store i32* %3, i32** %data1, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !98
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !99
  %5 = load i32*, i32** %data1, align 8, !dbg !100
  %6 = load i32*, i32** %data1, align 8, !dbg !101
  %call3 = call i64 @wcslen(i32* %6) #7, !dbg !102
  %call4 = call i32* @wcsncat(i32* %arraydecay2, i32* %5, i64 %call3) #6, !dbg !103
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !104
  store i32 0, i32* %arrayidx5, align 4, !dbg !105
  %7 = load i32*, i32** %data1, align 8, !dbg !106
  call void @printWLine(i32* %7), !dbg !107
  ret void, !dbg !108
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_31.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 12, scope: !11)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocation(line: 29, column: 13, scope: !11)
!29 = !DILocation(line: 29, column: 5, scope: !11)
!30 = !DILocation(line: 30, column: 5, scope: !11)
!31 = !DILocation(line: 30, column: 17, scope: !11)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !12, line: 32, type: !16)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!34 = !DILocation(line: 32, column: 19, scope: !33)
!35 = !DILocation(line: 32, column: 30, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !12, line: 33, type: !16)
!37 = !DILocation(line: 33, column: 19, scope: !33)
!38 = !DILocation(line: 33, column: 26, scope: !33)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !12, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !12, line: 34, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 35, column: 21, scope: !40)
!45 = !DILocation(line: 37, column: 21, scope: !40)
!46 = !DILocation(line: 37, column: 27, scope: !40)
!47 = !DILocation(line: 37, column: 40, scope: !40)
!48 = !DILocation(line: 37, column: 33, scope: !40)
!49 = !DILocation(line: 37, column: 13, scope: !40)
!50 = !DILocation(line: 38, column: 13, scope: !40)
!51 = !DILocation(line: 38, column: 24, scope: !40)
!52 = !DILocation(line: 39, column: 24, scope: !40)
!53 = !DILocation(line: 39, column: 13, scope: !40)
!54 = !DILocation(line: 42, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_31_good", scope: !12, file: !12, line: 70, type: !13, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 72, column: 5, scope: !55)
!57 = !DILocation(line: 73, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 84, type: !59, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!19, !19, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 84, type: !19)
!65 = !DILocation(line: 84, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 84, type: !61)
!67 = !DILocation(line: 84, column: 27, scope: !58)
!68 = !DILocation(line: 87, column: 22, scope: !58)
!69 = !DILocation(line: 87, column: 12, scope: !58)
!70 = !DILocation(line: 87, column: 5, scope: !58)
!71 = !DILocation(line: 89, column: 5, scope: !58)
!72 = !DILocation(line: 90, column: 5, scope: !58)
!73 = !DILocation(line: 91, column: 5, scope: !58)
!74 = !DILocation(line: 94, column: 5, scope: !58)
!75 = !DILocation(line: 95, column: 5, scope: !58)
!76 = !DILocation(line: 96, column: 5, scope: !58)
!77 = !DILocation(line: 98, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 51, type: !16)
!80 = !DILocation(line: 51, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !12, line: 52, type: !22)
!82 = !DILocation(line: 52, column: 13, scope: !78)
!83 = !DILocation(line: 53, column: 12, scope: !78)
!84 = !DILocation(line: 53, column: 10, scope: !78)
!85 = !DILocation(line: 55, column: 13, scope: !78)
!86 = !DILocation(line: 55, column: 5, scope: !78)
!87 = !DILocation(line: 56, column: 5, scope: !78)
!88 = !DILocation(line: 56, column: 16, scope: !78)
!89 = !DILocalVariable(name: "dataCopy", scope: !90, file: !12, line: 58, type: !16)
!90 = distinct !DILexicalBlock(scope: !78, file: !12, line: 57, column: 5)
!91 = !DILocation(line: 58, column: 19, scope: !90)
!92 = !DILocation(line: 58, column: 30, scope: !90)
!93 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 59, type: !16)
!94 = !DILocation(line: 59, column: 19, scope: !90)
!95 = !DILocation(line: 59, column: 26, scope: !90)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !12, line: 61, type: !41)
!97 = distinct !DILexicalBlock(scope: !90, file: !12, line: 60, column: 9)
!98 = !DILocation(line: 61, column: 21, scope: !97)
!99 = !DILocation(line: 63, column: 21, scope: !97)
!100 = !DILocation(line: 63, column: 27, scope: !97)
!101 = !DILocation(line: 63, column: 40, scope: !97)
!102 = !DILocation(line: 63, column: 33, scope: !97)
!103 = !DILocation(line: 63, column: 13, scope: !97)
!104 = !DILocation(line: 64, column: 13, scope: !97)
!105 = !DILocation(line: 64, column: 24, scope: !97)
!106 = !DILocation(line: 65, column: 24, scope: !97)
!107 = !DILocation(line: 65, column: 13, scope: !97)
!108 = !DILocation(line: 68, column: 1, scope: !78)
