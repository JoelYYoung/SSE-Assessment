; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61b_badSource(i32* %0), !dbg !29
  store i32* %call, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !36
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %call2 = call i64 @wcslen(i32* %3) #6, !dbg !40
  %call3 = call i32* @wcsncat(i32* %arraydecay1, i32* %2, i64 %call2) #7, !dbg !41
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* %4), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61b_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncat(i32*, i32*, i64) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #7, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #7, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !75
  store i32* %arraydecay, i32** %data, align 8, !dbg !76
  %0 = load i32*, i32** %data, align 8, !dbg !77
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61b_goodG2BSource(i32* %0), !dbg !78
  store i32* %call, i32** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !80, metadata !DIExpression()), !dbg !82
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !82
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !83
  %2 = load i32*, i32** %data, align 8, !dbg !84
  %3 = load i32*, i32** %data, align 8, !dbg !85
  %call2 = call i64 @wcslen(i32* %3) #6, !dbg !86
  %call3 = call i32* @wcsncat(i32* %arraydecay1, i32* %2, i64 %call2) #7, !dbg !87
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %4 = load i32*, i32** %data, align 8, !dbg !90
  call void @printWLine(i32* %4), !dbg !91
  ret void, !dbg !92
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 28, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 29, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 29, column: 13, scope: !11)
!26 = !DILocation(line: 30, column: 12, scope: !11)
!27 = !DILocation(line: 30, column: 10, scope: !11)
!28 = !DILocation(line: 31, column: 90, scope: !11)
!29 = !DILocation(line: 31, column: 12, scope: !11)
!30 = !DILocation(line: 31, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !12, line: 33, type: !33)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 33, column: 17, scope: !32)
!37 = !DILocation(line: 35, column: 17, scope: !32)
!38 = !DILocation(line: 35, column: 23, scope: !32)
!39 = !DILocation(line: 35, column: 36, scope: !32)
!40 = !DILocation(line: 35, column: 29, scope: !32)
!41 = !DILocation(line: 35, column: 9, scope: !32)
!42 = !DILocation(line: 36, column: 9, scope: !32)
!43 = !DILocation(line: 36, column: 20, scope: !32)
!44 = !DILocation(line: 37, column: 20, scope: !32)
!45 = !DILocation(line: 37, column: 9, scope: !32)
!46 = !DILocation(line: 39, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_61_good", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 65, column: 5, scope: !47)
!49 = !DILocation(line: 66, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 78, type: !51, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!19, !19, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 78, type: !19)
!57 = !DILocation(line: 78, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 78, type: !53)
!59 = !DILocation(line: 78, column: 27, scope: !50)
!60 = !DILocation(line: 81, column: 22, scope: !50)
!61 = !DILocation(line: 81, column: 12, scope: !50)
!62 = !DILocation(line: 81, column: 5, scope: !50)
!63 = !DILocation(line: 83, column: 5, scope: !50)
!64 = !DILocation(line: 84, column: 5, scope: !50)
!65 = !DILocation(line: 85, column: 5, scope: !50)
!66 = !DILocation(line: 88, column: 5, scope: !50)
!67 = !DILocation(line: 89, column: 5, scope: !50)
!68 = !DILocation(line: 90, column: 5, scope: !50)
!69 = !DILocation(line: 92, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 50, type: !16)
!72 = !DILocation(line: 50, column: 15, scope: !70)
!73 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !12, line: 51, type: !22)
!74 = !DILocation(line: 51, column: 13, scope: !70)
!75 = !DILocation(line: 52, column: 12, scope: !70)
!76 = !DILocation(line: 52, column: 10, scope: !70)
!77 = !DILocation(line: 53, column: 94, scope: !70)
!78 = !DILocation(line: 53, column: 12, scope: !70)
!79 = !DILocation(line: 53, column: 10, scope: !70)
!80 = !DILocalVariable(name: "dest", scope: !81, file: !12, line: 55, type: !33)
!81 = distinct !DILexicalBlock(scope: !70, file: !12, line: 54, column: 5)
!82 = !DILocation(line: 55, column: 17, scope: !81)
!83 = !DILocation(line: 57, column: 17, scope: !81)
!84 = !DILocation(line: 57, column: 23, scope: !81)
!85 = !DILocation(line: 57, column: 36, scope: !81)
!86 = !DILocation(line: 57, column: 29, scope: !81)
!87 = !DILocation(line: 57, column: 9, scope: !81)
!88 = !DILocation(line: 58, column: 9, scope: !81)
!89 = !DILocation(line: 58, column: 20, scope: !81)
!90 = !DILocation(line: 59, column: 20, scope: !81)
!91 = !DILocation(line: 59, column: 9, scope: !81)
!92 = !DILocation(line: 61, column: 1, scope: !70)
