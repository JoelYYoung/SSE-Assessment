; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !21, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %dataBuffer, align 8, !dbg !29
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %call1 = call i32* @wmemset(i32* %1, i32 65, i64 99) #4, !dbg !33
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %add.ptr = getelementptr inbounds i32, i32* %3, i64 -8, !dbg !37
  store i32* %add.ptr, i32** %data, align 8, !dbg !38
  %4 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx2 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !40
  store i32* %4, i32** %arrayidx2, align 16, !dbg !41
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !42
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66b_badSink(i32** %arraydecay), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66b_badSink(i32**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #4, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #4, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !68 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !71, metadata !DIExpression()), !dbg !72
  store i32* null, i32** %data, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !76
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !77
  %0 = bitcast i8* %call to i32*, !dbg !78
  store i32* %0, i32** %dataBuffer, align 8, !dbg !76
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  %call1 = call i32* @wmemset(i32* %1, i32 65, i64 99) #4, !dbg !80
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !81
  store i32 0, i32* %arrayidx, align 4, !dbg !82
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  store i32* %3, i32** %data, align 8, !dbg !84
  %4 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx2 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !86
  store i32* %4, i32** %arrayidx2, align 16, !dbg !87
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !88
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66b_goodG2BSink(i32** %arraydecay), !dbg !89
  ret void, !dbg !90
}

declare dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66b_goodG2BSink(i32**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataArray", scope: !15, file: !16, line: 29, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 5)
!25 = !DILocation(line: 29, column: 15, scope: !15)
!26 = !DILocation(line: 30, column: 10, scope: !15)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !16, line: 32, type: !4)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!29 = !DILocation(line: 32, column: 19, scope: !28)
!30 = !DILocation(line: 32, column: 43, scope: !28)
!31 = !DILocation(line: 32, column: 32, scope: !28)
!32 = !DILocation(line: 33, column: 17, scope: !28)
!33 = !DILocation(line: 33, column: 9, scope: !28)
!34 = !DILocation(line: 34, column: 9, scope: !28)
!35 = !DILocation(line: 34, column: 27, scope: !28)
!36 = !DILocation(line: 36, column: 16, scope: !28)
!37 = !DILocation(line: 36, column: 27, scope: !28)
!38 = !DILocation(line: 36, column: 14, scope: !28)
!39 = !DILocation(line: 39, column: 20, scope: !15)
!40 = !DILocation(line: 39, column: 5, scope: !15)
!41 = !DILocation(line: 39, column: 18, scope: !15)
!42 = !DILocation(line: 40, column: 64, scope: !15)
!43 = !DILocation(line: 40, column: 5, scope: !15)
!44 = !DILocation(line: 41, column: 1, scope: !15)
!45 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memcpy_66_good", scope: !16, file: !16, line: 66, type: !17, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 68, column: 5, scope: !45)
!47 = !DILocation(line: 69, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 81, type: !49, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!7, !7, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !16, line: 81, type: !7)
!55 = !DILocation(line: 81, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !16, line: 81, type: !51)
!57 = !DILocation(line: 81, column: 27, scope: !48)
!58 = !DILocation(line: 84, column: 22, scope: !48)
!59 = !DILocation(line: 84, column: 12, scope: !48)
!60 = !DILocation(line: 84, column: 5, scope: !48)
!61 = !DILocation(line: 86, column: 5, scope: !48)
!62 = !DILocation(line: 87, column: 5, scope: !48)
!63 = !DILocation(line: 88, column: 5, scope: !48)
!64 = !DILocation(line: 91, column: 5, scope: !48)
!65 = !DILocation(line: 92, column: 5, scope: !48)
!66 = !DILocation(line: 93, column: 5, scope: !48)
!67 = !DILocation(line: 95, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 50, type: !17, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !16, line: 52, type: !4)
!70 = !DILocation(line: 52, column: 15, scope: !68)
!71 = !DILocalVariable(name: "dataArray", scope: !68, file: !16, line: 53, type: !22)
!72 = !DILocation(line: 53, column: 15, scope: !68)
!73 = !DILocation(line: 54, column: 10, scope: !68)
!74 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !16, line: 56, type: !4)
!75 = distinct !DILexicalBlock(scope: !68, file: !16, line: 55, column: 5)
!76 = !DILocation(line: 56, column: 19, scope: !75)
!77 = !DILocation(line: 56, column: 43, scope: !75)
!78 = !DILocation(line: 56, column: 32, scope: !75)
!79 = !DILocation(line: 57, column: 17, scope: !75)
!80 = !DILocation(line: 57, column: 9, scope: !75)
!81 = !DILocation(line: 58, column: 9, scope: !75)
!82 = !DILocation(line: 58, column: 27, scope: !75)
!83 = !DILocation(line: 60, column: 16, scope: !75)
!84 = !DILocation(line: 60, column: 14, scope: !75)
!85 = !DILocation(line: 62, column: 20, scope: !68)
!86 = !DILocation(line: 62, column: 5, scope: !68)
!87 = !DILocation(line: 62, column: 18, scope: !68)
!88 = !DILocation(line: 63, column: 68, scope: !68)
!89 = !DILocation(line: 63, column: 5, scope: !68)
!90 = !DILocation(line: 64, column: 1, scope: !68)
