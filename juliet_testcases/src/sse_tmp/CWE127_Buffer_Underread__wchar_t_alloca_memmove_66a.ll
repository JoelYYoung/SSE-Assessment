; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memmove_66a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memmove_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_66_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx1 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !38
  store i32* %5, i32** %arrayidx1, align 16, !dbg !39
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !40
  call void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_66b_badSink(i32** %arraydecay), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_66b_badSink(i32**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_66_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #4, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #4, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_66_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_66_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = alloca i8, i64 400, align 16, !dbg !73
  %1 = bitcast i8* %0 to i32*, !dbg !74
  store i32* %1, i32** %dataBuffer, align 8, !dbg !72
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !75
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !76
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  store i32* %4, i32** %data, align 8, !dbg !80
  %5 = load i32*, i32** %data, align 8, !dbg !81
  %arrayidx1 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !82
  store i32* %5, i32** %arrayidx1, align 16, !dbg !83
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !84
  call void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_66b_goodG2BSink(i32** %arraydecay), !dbg !85
  ret void, !dbg !86
}

declare dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_66b_goodG2BSink(i32**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memmove_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_memmove_66_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memmove_66a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataArray", scope: !15, file: !16, line: 29, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 5)
!25 = !DILocation(line: 29, column: 15, scope: !15)
!26 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 30, type: !4)
!27 = !DILocation(line: 30, column: 15, scope: !15)
!28 = !DILocation(line: 30, column: 39, scope: !15)
!29 = !DILocation(line: 30, column: 28, scope: !15)
!30 = !DILocation(line: 31, column: 13, scope: !15)
!31 = !DILocation(line: 31, column: 5, scope: !15)
!32 = !DILocation(line: 32, column: 5, scope: !15)
!33 = !DILocation(line: 32, column: 23, scope: !15)
!34 = !DILocation(line: 34, column: 12, scope: !15)
!35 = !DILocation(line: 34, column: 23, scope: !15)
!36 = !DILocation(line: 34, column: 10, scope: !15)
!37 = !DILocation(line: 36, column: 20, scope: !15)
!38 = !DILocation(line: 36, column: 5, scope: !15)
!39 = !DILocation(line: 36, column: 18, scope: !15)
!40 = !DILocation(line: 37, column: 65, scope: !15)
!41 = !DILocation(line: 37, column: 5, scope: !15)
!42 = !DILocation(line: 38, column: 1, scope: !15)
!43 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_memmove_66_good", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 62, column: 5, scope: !43)
!45 = !DILocation(line: 63, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 75, type: !47, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!7, !7, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !16, line: 75, type: !7)
!53 = !DILocation(line: 75, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !16, line: 75, type: !49)
!55 = !DILocation(line: 75, column: 27, scope: !46)
!56 = !DILocation(line: 78, column: 22, scope: !46)
!57 = !DILocation(line: 78, column: 12, scope: !46)
!58 = !DILocation(line: 78, column: 5, scope: !46)
!59 = !DILocation(line: 80, column: 5, scope: !46)
!60 = !DILocation(line: 81, column: 5, scope: !46)
!61 = !DILocation(line: 82, column: 5, scope: !46)
!62 = !DILocation(line: 85, column: 5, scope: !46)
!63 = !DILocation(line: 86, column: 5, scope: !46)
!64 = !DILocation(line: 87, column: 5, scope: !46)
!65 = !DILocation(line: 89, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !16, line: 49, type: !4)
!68 = !DILocation(line: 49, column: 15, scope: !66)
!69 = !DILocalVariable(name: "dataArray", scope: !66, file: !16, line: 50, type: !22)
!70 = !DILocation(line: 50, column: 15, scope: !66)
!71 = !DILocalVariable(name: "dataBuffer", scope: !66, file: !16, line: 51, type: !4)
!72 = !DILocation(line: 51, column: 15, scope: !66)
!73 = !DILocation(line: 51, column: 39, scope: !66)
!74 = !DILocation(line: 51, column: 28, scope: !66)
!75 = !DILocation(line: 52, column: 13, scope: !66)
!76 = !DILocation(line: 52, column: 5, scope: !66)
!77 = !DILocation(line: 53, column: 5, scope: !66)
!78 = !DILocation(line: 53, column: 23, scope: !66)
!79 = !DILocation(line: 55, column: 12, scope: !66)
!80 = !DILocation(line: 55, column: 10, scope: !66)
!81 = !DILocation(line: 56, column: 20, scope: !66)
!82 = !DILocation(line: 56, column: 5, scope: !66)
!83 = !DILocation(line: 56, column: 18, scope: !66)
!84 = !DILocation(line: 57, column: 69, scope: !66)
!85 = !DILocation(line: 57, column: 5, scope: !66)
!86 = !DILocation(line: 58, column: 1, scope: !66)
