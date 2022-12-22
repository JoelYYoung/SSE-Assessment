; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
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
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !37
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %call2 = call i64 @wcslen(i32* %3) #7, !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %4) #6, !dbg !42
  %5 = load i32*, i32** %data, align 8, !dbg !43
  call void @printWLine(i32* %5), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_01_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #6, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #6, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_01_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_01_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !74
  store i32* %arraydecay, i32** %data, align 8, !dbg !75
  %0 = load i32*, i32** %data, align 8, !dbg !76
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !77
  %1 = load i32*, i32** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !80, metadata !DIExpression()), !dbg !82
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !82
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !83
  %3 = load i32*, i32** %data, align 8, !dbg !84
  %call2 = call i64 @wcslen(i32* %3) #7, !dbg !85
  %4 = load i32*, i32** %data, align 8, !dbg !86
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %4) #6, !dbg !87
  %5 = load i32*, i32** %data, align 8, !dbg !88
  call void @printWLine(i32* %5), !dbg !89
  ret void, !dbg !90
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_01_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_01.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 32, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 32, column: 13, scope: !11)
!26 = !DILocation(line: 33, column: 12, scope: !11)
!27 = !DILocation(line: 33, column: 10, scope: !11)
!28 = !DILocation(line: 35, column: 13, scope: !11)
!29 = !DILocation(line: 35, column: 5, scope: !11)
!30 = !DILocation(line: 36, column: 5, scope: !11)
!31 = !DILocation(line: 36, column: 17, scope: !11)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !12, line: 38, type: !34)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 38, column: 17, scope: !33)
!38 = !DILocation(line: 40, column: 18, scope: !33)
!39 = !DILocation(line: 40, column: 31, scope: !33)
!40 = !DILocation(line: 40, column: 24, scope: !33)
!41 = !DILocation(line: 40, column: 45, scope: !33)
!42 = !DILocation(line: 40, column: 9, scope: !33)
!43 = !DILocation(line: 41, column: 20, scope: !33)
!44 = !DILocation(line: 41, column: 9, scope: !33)
!45 = !DILocation(line: 43, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_01_good", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 68, column: 5, scope: !46)
!48 = !DILocation(line: 69, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 81, type: !50, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!19, !19, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 81, type: !19)
!56 = !DILocation(line: 81, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 81, type: !52)
!58 = !DILocation(line: 81, column: 27, scope: !49)
!59 = !DILocation(line: 84, column: 22, scope: !49)
!60 = !DILocation(line: 84, column: 12, scope: !49)
!61 = !DILocation(line: 84, column: 5, scope: !49)
!62 = !DILocation(line: 86, column: 5, scope: !49)
!63 = !DILocation(line: 87, column: 5, scope: !49)
!64 = !DILocation(line: 88, column: 5, scope: !49)
!65 = !DILocation(line: 91, column: 5, scope: !49)
!66 = !DILocation(line: 92, column: 5, scope: !49)
!67 = !DILocation(line: 93, column: 5, scope: !49)
!68 = !DILocation(line: 95, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 52, type: !16)
!71 = !DILocation(line: 52, column: 15, scope: !69)
!72 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !12, line: 53, type: !22)
!73 = !DILocation(line: 53, column: 13, scope: !69)
!74 = !DILocation(line: 54, column: 12, scope: !69)
!75 = !DILocation(line: 54, column: 10, scope: !69)
!76 = !DILocation(line: 56, column: 13, scope: !69)
!77 = !DILocation(line: 56, column: 5, scope: !69)
!78 = !DILocation(line: 57, column: 5, scope: !69)
!79 = !DILocation(line: 57, column: 16, scope: !69)
!80 = !DILocalVariable(name: "dest", scope: !81, file: !12, line: 59, type: !34)
!81 = distinct !DILexicalBlock(scope: !69, file: !12, line: 58, column: 5)
!82 = !DILocation(line: 59, column: 17, scope: !81)
!83 = !DILocation(line: 61, column: 18, scope: !81)
!84 = !DILocation(line: 61, column: 31, scope: !81)
!85 = !DILocation(line: 61, column: 24, scope: !81)
!86 = !DILocation(line: 61, column: 45, scope: !81)
!87 = !DILocation(line: 61, column: 9, scope: !81)
!88 = !DILocation(line: 62, column: 20, scope: !81)
!89 = !DILocation(line: 62, column: 9, scope: !81)
!90 = !DILocation(line: 64, column: 1, scope: !69)
